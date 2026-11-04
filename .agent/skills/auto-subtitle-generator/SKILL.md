---
name: auto-subtitle-generator
description: Transcribe video audio with Whisper AI, generate word-level timestamped captions, and burn animated viral-style subtitles (TikTok/Reels karaoke style) using FFmpeg.
---

# Automated Animated Subtitle Generator (TikTok/Reels Style)

## 1. Architecture Overview
1. **Audio Extraction:** Extract clean 16kHz mono audio from target video using FFmpeg.
2. **Transcription with Word Timestamps:** Use `faster-whisper` or OpenAI Whisper with `word_timestamps=True`.
3. **Chunking & Formatting:** Group words into bite-sized 2 to 4 word snippets (never walls of text).
4. **SubStation Alpha (`.ass`) Styling:** Render colorful, high-contrast, animated subtitle cards.
5. **Burn-in Video Render:** Encode subtitles directly into the video stream via FFmpeg filter.

---

## 2. Audio Extraction & Whisper Transcription (Python)
```python
import subprocess
from faster_whisper import WhisperModel

def transcribe_with_words(video_path, audio_temp="temp_audio.wav"):
    # 1. Extract audio
    subprocess.run(["ffmpeg", "-y", "-i", video_path, "-vn", "-ar", "16000", "-ac", "1", audio_temp], check=True)
    
    # 2. Transcribe locally on CPU or GPU
    model = WhisperModel("base", device="cpu", compute_type="int8")
    segments, info = model.transcribe(audio_temp, word_timestamps=True, language="id") # or "en"
    
    word_list = []
    for segment in segments:
        for word in segment.words:
            word_list.append({"word": word.word.strip(), "start": word.start, "end": word.end})
    return word_list
```

---

## 3. SubStation Alpha (`.ass`) Styling Specifications
TikTok/Reels audience retention requires **fast-paced, centered, large text** that pops:

- **Font Family:** `Montserrat`, `Impact`, `Komika Axis`, or `Arial Black`.
- **Font Size:** `18` - `24` (in 1080x1920 canvas).
- **Positioning:** Center-lower third: `Alignment=2` (Bottom Center), `MarginV=300` (well above TikTok's bottom username and caption overlay).
- **Colors:**
  - Base text: Bright White (`&H00FFFFFF`) or Canary Yellow (`&H0000DDF7`).
  - Outline / Stroke: Pure Black (`&H00000000`), `Outline=3`.
  - Drop Shadow: `Shadow=2`.
- **Word Highlighting (Karaoke style):** Highlight the currently spoken word in Neon Green (`&H0039FF14`) or Bright Gold.

---

## 4. Burning Subtitles into Video via FFmpeg
Run the FFmpeg burn-in command:
```bash
ffmpeg -y -i input.mp4 -vf "ass=subtitles.ass" -c:v libx264 -crf 22 -preset medium -c:a copy output_subtitled.mp4
```

*Note on Windows path escaping:* In FFmpeg filters, escape colons and backslashes in the subtitle path:  
`subtitles.ass` -> `"ass=subtitles.ass"` or `"ass='C\:/path/to/subtitles.ass'"`

---

## 5. Retention Guidelines
- **Max Words On Screen:** 2 to 4 words at any millisecond. Large paragraphs destroy retention.
- **Auto-Casing:** Convert words to `UPPERCASE` for punchy energy.
- **Sound Effect Cues:** Emphasize punchline words with small scale pop effects or sound cues.
