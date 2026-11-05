---
name: editonny
description: Local conversational video editing skill for cutting pauses and mistakes, generating animated captions with OCR verification, normalizing audio to -14 LUFS, vertical reframing, and inserting motion scenes.
---

# Editonny — Conversational Local Video Editing & Motion Studio

Inspired by [soumatheusgomes/editonny](https://github.com/soumatheusgomes/editonny). An open-source, production-grade video editing skill for AI coding agents. Cut pauses and mistakes, add kinetic captions, master voice audio, reframe to vertical (9:16), and orchestrate motion graphics—all executed 100% locally through natural language conversation.

---

## 1. Core Operating Philosophy & Local-First Principles

1. **100% Local Execution (Zero Cloud Uploads):** All audio extraction, Whisper transcription, subtitle burning, and video rendering run on your local machine using FFmpeg and Python. No third-party API costs; complete data privacy.
2. **Never Blind-Edit (The Confirmation Protocol):** Every editing request starts with a non-destructive inspection. The agent displays a **10-Area Settings Card** and waits for explicit user confirmation before creating project workspaces or rendering final files.
3. **Preserve Original Asset Integrity:** Never apply destructive color filters, contrast shifts, or unwanted audio tracks unless explicitly requested. Respect original camera colors, framing, and speech language.

---

## 2. The 10-Area Pre-Flight Confirmation Card

Before running heavy encoding or cutting footage, inspect the media files and present this standardized settings card for user approval:

```markdown
### 📋 Editonny Editing Confirmation Card

1. **🎯 Goal & Pacing:** [e.g. Fast-paced TikTok Reel / Educational Tutorial / Clean Podcast Cut]
2. **🎬 Source Videos:** [Filename(s), resolution, FPS, duration]
3. **🎨 Image Treatment:** Original color grading preserved (no destructive auto-enhancements).
4. **📐 Format & Aspect Ratio:** [e.g. 1080x1920 (9:16 Vertical) with smart center crop / blur background]
5. **🌐 Languages:** Spoken: [Detected, e.g. Indonesian/English] · Captions: [Matching / Translated]
6. **💬 Captions:** Word-level kinetic captions enabled (1–3 words per line, safe-zone checked).
7. **✂️ Cleanup & Trimming:** Auto-cut silence > 0.4s and repeated takes/stutters.
8. **🔊 Sound Mastering:** Vocal normalized to -14 LUFS, noise gate enabled, headroom -1.5 dBTP. Additional BGM: [Off unless requested].
9. **✨ Visuals & Motion:** [e.g. Kinetic text callout on key phrases, 3D metric badge, zoom punches].
10. **📦 Output & Destination:** Export to `exports/[filename]-final.mp4`.

👉 *Ketik "Lanjut" atau beri penyesuaian untuk memulai proses render.*
```

---

## 3. The 5 Core Editing Engines

### A. Pause & Silence Trimming (Smart J-Cut & L-Cut)
- **Audio Analysis:** Scan vocal decibel thresholds using `silencedetect` in FFmpeg or Whisper timestamps:
  ```powershell
  ffmpeg -i input.mp4 -af "silencedetect=noise=-35dB:d=0.4" -f null -
  ```
- **Cut Execution:** Segment speech intervals, discard dead air > 400ms, and rejoin with a 15ms audio cross-fade (`afade`) to prevent audible audio popping or clicking.

### B. Animated Word-Level Captions (Karaoke Style)
- **Transcription:** Local Whisper AI model generates word-level start/end timestamps.
- **Visual Styling:**
  - Font: Bold modern geometric sans (Inter, Impact, Montserrat, or TheBoldFont).
  - Density: 1 to 3 words per subtitle block for maximum retention on short-form video.
  - Colors: High-contrast white text with black stroke (3px), active word highlighted in Electric Lime (`#B7F538`) or Gold (`#FACC15`).
- **OCR Quality Gate:** Run local OCR (Tesseract / Apple Vision) to verify text placement avoids mobile UI dead-zones (Instagram/TikTok bottom caption and right button overlays).

### C. Broadcast Audio Mastering (-14 LUFS)
- **Loudness Normalization:** Conforms audio to social media streaming standards (EBU R128 / ITU-R BS.1770-4):
  ```powershell
  ffmpeg -i input.mp4 -af "loudnorm=I=-14:LRA=7:TP=-1.5" -c:v copy output_audio.mp4
  ```
- **Voice Clarity:** High-pass filter at 80Hz (cuts mic rumble) and noise reduction filter.

### D. Smart Vertical Reframing (16:9 to 9:16)
- **Center Focus Crop:** Scales 1920x1080 horizontal footage to fill 1080x1920 with blurred backdrop:
  ```powershell
  ffmpeg -i input.mp4 -filter_complex "[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,boxblur=20:5[bg];[0:v]scale=1080:-1[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2" -c:a copy vertical.mp4
  ```

### E. Motion Scenes & Kinetic Visual Overlays
- Supports 145 motion scene archetypes:
  - **Metric Stat Cards:** Glowing 3D KPI badges (e.g. `+120% Growth`).
  - **Zoom Punches:** Dynamic camera punch-in (`scale=1.15`) on punchlines or emphasis points.
  - **Lower Thirds:** Clean animated name/role tags.
  - **Split Screens & Transitions:** Smooth horizontal wipes and slide-ins.

---

## 4. Post-Render Delivery Card

After rendering completes, verify playback and present the final delivery card to the user:

```markdown
### ✅ Video Anda Selesai Dirender!

- 🎬 **File Output:** `exports/reels-final.mp4`
- 📁 **Folder Proyek:** `workspaces/editonny-session-01/`
- ✂️ **Rangkuman Perubahan:** 
  - Durasi: 03:15 ➔ 02:08 (hemat 1 menit 7 detik).
  - 14 jeda hening dan 2 take salah bicara berhasil dipotong.
  - Subtitel animasi karaoke (kuning/lime) aktif di posisi aman.
  - Audio vokal dinormalisasi ke -14 LUFS (jernih & seimbang).
- 🔍 **Hasil Quality Gate:** Playback mulus, audio tidak pecah, teks bebas typo terverifikasi.

👉 *Ingin revisi? Cukup ketik instruksi Anda (misal: "perbesar teks subtitel" atau "ganti warna kata aktif ke biru").*
```

---

## 5. Ready-to-Use Agent Prompts

1. **Auto-Cut & Clean Up:**
   > *"Gunakan skill editonny untuk memotong semua jeda hening pada video 'raw_video.mp4', normalisasi audio ke -14 LUFS, dan siapkan format 9:16 untuk Reels."*

2. **Full Viral Short Package:**
   > *"Gunakan skill editonny untuk memproses rekaman podcast ini: potong bagian salah bicara, tambahkan subtitel animasi kata-per-kata gaya TikTok, dan berikan zoom-in halus pada setiap kalimat kunci."*
