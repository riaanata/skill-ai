---
name: ffmpeg-media-pipeline
description: Automate video clipping, aspect-ratio conversion (16:9 to 9:16 vertical), lossless audio extraction, and web/mobile video optimization using FFmpeg.
---

# FFmpeg Media & Video Processing Pipeline

## 1. High-Speed Lossless Clipping
- To cut video without re-encoding (instant speed):
  ```bash
  ffmpeg -ss [START_TIME] -to [END_TIME] -accurate_seek -i input.mp4 -c copy output.mp4
  ```
  *(Always place `-ss` and `-to` before `-i` for fast keyframe seeking).*

## 2. Social Media Aspect Ratio Conversion (16:9 -> 9:16 Vertical)
- **Option A (Smart Center Crop):**
  ```bash
  ffmpeg -i input.mp4 -vf "crop=ih*9/16:ih" -c:a copy output_vertical.mp4
  ```
- **Option B (Blur Background + Centered Original):**
  Best for horizontal content converted to TikTok/Reels without losing content:
  ```bash
  ffmpeg -i input.mp4 -vf "split[v1][v2];[v1]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,boxblur=20:5[bg];[v2]scale=1080:1920:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2" -c:a copy output_blurred.mp4
  ```

## 3. Web & Mobile Video Compression (CRF Encoding)
- Compress large screen-recordings or raw videos without visible quality degradation:
  ```bash
  ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k -movflags +faststart compressed.mp4
  ```
  *Note: `-movflags +faststart` enables immediate playback on web/mobile browsers before the entire video finishes downloading.*

## 4. Audio Extraction & Format Normalization
- Extract raw audio for transcription/analysis:
  ```bash
  ffmpeg -i input.mp4 -vn -c:a libmp3lame -q:a 2 audio.mp3
  ```
- Convert audio to 16kHz mono WAV (optimal format for Whisper AI speech-to-text):
  ```bash
  ffmpeg -i input.mp4 -vn -ar 16000 -ac 1 -c:a pcm_s16le audio_whisper.wav
  ```
