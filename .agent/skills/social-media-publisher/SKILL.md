---
name: social-media-publisher
description: Automate scheduled or instant video uploads to TikTok, Instagram Reels, and YouTube Shorts using cookie-based browser automation (Playwright) and the YouTube Data API v3.
---

# Social Media Video Publisher (TikTok, IG Reels, YouTube Shorts)

## 1. Pre-Upload Video Verification
Before initiating any upload, verify video specifications:
- **Aspect Ratio:** Must be vertical `9:16` (ideal resolution: `1080x1920`).
- **Format & Codec:** Container `.mp4`, Video codec `H.264` (`libx264`), Audio codec `AAC`.
- **Duration Constraints:**
  - YouTube Shorts: <= 60 seconds (up to 3 minutes for newer format).
  - TikTok: 15s to 10 minutes.
  - Instagram Reels: <= 90 seconds.
- **Fast-Start Check:** Ensure `-movflags +faststart` is applied for rapid web processing.

---

## 2. YouTube Shorts (Official API Route - Recommended)
The most stable and resilient method for YouTube Shorts is the official **YouTube Data API v3**.

### Authentication & Setup
1. Enable YouTube Data API v3 in Google Cloud Console.
2. Download `client_secret.json`.
3. Use `google-auth-oauthlib` and `google-api-python-client`.

### Upload Routine Pattern (Python)
```python
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from google_auth_oauthlib.flow import InstalledAppFlow

SCOPES = ["https://www.googleapis.com/auth/youtube.upload"]

def upload_short(youtube, file_path, title, description, tags, privacy="public"):
    # Ensure #Shorts is present in title or description to trigger Shorts shelf
    if "#Shorts" not in title and "#Shorts" not in description:
        description += "\n\n#Shorts"

    body = {
        "snippet": {
            "title": title[:100],
            "description": description[:5000],
            "tags": tags,
            "categoryId": "22"  # People & Blogs or Entertainment
        },
        "status": {
            "privacyStatus": privacy,
            "selfDeclaredMadeForKids": False
        }
    }

    media = MediaFileUpload(file_path, chunksize=-1, resumable=True, mimetype="video/mp4")
    request = youtube.videos().insert(part="snippet,status", body=body, media_body=media)

    response = None
    while response is None:
        status, response = request.next_chunk()
        if status:
            print(f"Uploaded {int(status.progress() * 100)}%")
    return response["id"]
```

---

## 3. TikTok Studio Upload (Playwright Session Route)
Uses persistent browser sessions to upload via web creator interface without complex enterprise developer verification.

### Session Capture (Run Once Manually)
```python
from playwright.sync_api import sync_playwright

def save_tiktok_session():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        context = browser.new_context()
        page = context.new_page()
        page.goto("https://www.tiktok.com/tiktokstudio/upload")
        print("Silakan login di jendela browser. Setelah masuk ke halaman upload, tekan Enter di terminal...")
        input()
        context.storage_state(path="tiktok_session.json")
        print("Sesi TikTok tersimpan di tiktok_session.json")
        browser.close()
```

### Automated Upload Flow
1. Launch Chromium with `storage_state="tiktok_session.json"`.
2. Navigate to `https://www.tiktok.com/tiktokstudio/upload`.
3. Upload the MP4 file by targeting the file input:
   ```python
   page.set_input_files('input[type="file"]', video_path)
   ```
4. Wait for video processing confirmation (`page.wait_for_selector('text="Uploaded"')` or progress reaching 100%).
5. Fill caption & hashtags into the contenteditable caption editor:
   ```python
   caption_box = page.locator('div[contenteditable="true"]')
   caption_box.click()
   caption_box.fill("")
   caption_box.type(f"{title} #fyp #viral #shorts", delay=50) # Simulated human typing
   ```
6. Click the Post button:
   ```python
   page.get_by_role("button", name="Post").click()
   page.wait_for_selector('text="Your video has been uploaded"', timeout=30000)
   ```

---

## 4. Instagram Reels Upload (Playwright Route)
1. Use persistent session with `instagram_session.json`.
2. Target: `https://www.instagram.com/`.
3. Click the **"Create" / "+"** navigation button.
4. Select or drag the video file into the modal input:
   ```python
   page.set_input_files('input[type="file"]', video_path)
   ```
5. Choose aspect ratio `9:16` in the crop tool popup.
6. Advance through cover selection to the final caption step.
7. Type caption & hashtags with simulated delay.
8. Click **"Share"** and wait for the confirmation checkmark banner.

---

## 5. Account Safety & Anti-Spam Guidelines
- **Daily Upload Volume:** Limit uploads to **2 - 4 videos per day** per account to avoid algorithmic shadowbanning.
- **Interval Spacing:** Separate uploads by at least **2 to 4 hours**; never burst-post in the same minute.
- **Credential Storage:** Store `*_session.json` and `client_secret.json` in `.gitignore`. Never commit sessions to version control.
- **Failure Alerting:** Take a screenshot on any failure (`page.screenshot(path="upload_error.png")`) to immediately detect UI changes or captcha challenges.
