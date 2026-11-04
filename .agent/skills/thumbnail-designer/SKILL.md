---
name: thumbnail-designer
description: Design high-CTR YouTube thumbnails, TikTok/Reels covers, and social cards programmatically using Python Pillow, SVG rendering, and visual contrast psychology.
---

# High-CTR Thumbnail & Cover Designer

## 1. Dimensional Standards & Safe Zones
- **YouTube Thumbnail:** `1280x720` (16:9 ratio), minimum width `640px`, file size < 2MB (`.jpg` or `.webp`).
  - *Dead Zone:* Bottom-right corner (`~200x50px`) is covered by timestamp overlay. Never place text or critical faces here.
- **TikTok / Reels Cover:** `1080x1920` (9:16 vertical ratio).
  - *Safe Zone:* Center `1080x1080` square. Keep titles strictly within `y = 400px` to `y = 1500px` to avoid TikTok UI icons on the right and bottom account tags.

## 2. Visual Hierarchy & Composition Rules
- **Rule of Big Faces:** If using a human subject/face, it should occupy **35% to 50%** of the canvas with clear, exaggerated emotion (curiosity, shock, delight, determination).
- **The 3-Element Rule:** Never clutter a thumbnail. Max 3 focal elements:
  1. Main Subject (e.g., person, stock chart, device).
  2. Bold Short Text (Max 3-5 words).
  3. Visual Prop/Graphic (e.g., arrow, badge, icon, dollar glow).
- **Text Styling Standards:**
  - Font: Ultra-bold sans-serif (e.g., Anton, Montserrat Black, Impact, Plus Jakarta Sans ExtraBold).
  - Contrast: High-contrast yellow (`#FFDD00`) or white on dark background.
  - Outline & Shadow: Always add a thick dark stroke (`stroke_width=6-10`) and soft drop shadow so text pops against any background.

## 3. Programmatic Pillow Generation Pattern (Python)
```python
from PIL import Image, ImageDraw, ImageFont, ImageFilter

def create_thumbnail(background_path, output_path, headline_text, accent_color=(255, 221, 0)):
    # 1. Canvas setup
    img = Image.open(background_path).convert("RGBA").resize((1280, 720), Image.Resampling.LANCZOS)
    
    # 2. Add subtle dark gradient overlay for text readability
    overlay = Image.new("RGBA", img.size, (0, 0, 0, 0))
    draw_overlay = ImageDraw.Draw(overlay)
    draw_overlay.rectangle([(0, 0), (700, 720)], fill=(0, 0, 0, 140)) # Dark left half
    img = Image.alpha_composite(img, overlay)
    
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype("arialbd.ttf", 72) # Or custom bold font
    
    # 3. Draw text with thick stroke outline
    x, y = 60, 280
    draw.text((x, y), headline_text, font=font, fill=accent_color, stroke_width=6, stroke_fill=(0, 0, 0))
    
    img.convert("RGB").save(output_path, "JPEG", quality=90)
```

## 4. Anti-Patterns
- Never repeat the exact video title in the thumbnail. The thumbnail text should complement, tease, or create a curiosity gap.
- Never use thin serif fonts or low-contrast pastels that disappear on mobile screens.
- Avoid tiny details: Test the thumbnail by scaling it down to 10% size (mobile feed view); if the text is unreadable, increase font size.
