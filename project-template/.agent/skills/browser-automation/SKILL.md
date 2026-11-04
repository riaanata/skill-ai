---
name: browser-automation
description: Automate browser workflows, human-like interaction, form submissions, and login flows using Playwright/Puppeteer with stealth anti-detection practices.
---

# Browser Automation & Stealth Workflows

## 1. Anti-Detection & Stealth Setup
- **Disable Automation Indicators:**
  - Mask `navigator.webdriver = false`.
  - Override `chrome.runtime`, permissions, and plugins list.
  - Set a realistic browser viewport (e.g. `1920x1080` or `1366x768`) and user-agent string matching real Windows/Mac desktop browsers.
- **Avoid Headless Signature:** Use `headless: "new"` or standard headed mode with a virtual display for bot-sensitive targets.

## 2. Human-Like Behavior Simulation
- **Typing:** Never use instant `.fill()` on bot-sensitive forms. Use simulated keystrokes with randomized delay (e.g., `50ms - 150ms` per character).
- **Navigation & Scrolling:** Scroll in progressive chunks using smooth scrolling behavior rather than instant jump to bottom.
- **Mouse Movement:** Move mouse smoothly before clicking interactive buttons.

## 3. Resilient Selector Strategy
- Avoid fragile auto-generated selectors (e.g. `div > div.x-123 > p:nth-child(2)`).
- Prefer semantic, accessibility-based selectors:
  - By Role: `page.get_by_role("button", name="Submit")`
  - By Label: `page.get_by_label("Username")`
  - By Test ID: `page.get_by_test_id("checkout-btn")`
  - By Text: `page.get_by_text("Konfirmasi Pesanan")`

## 4. Waiting & State Verification
- Never use arbitrary `sleep(5000)` timers.
- Wait for explicit conditions:
  - `wait_for_selector(state="visible")`
  - `wait_for_load_state("networkidle")`
  - `wait_for_response(lambda res: "api/data" in res.url and res.status == 200)`
- Take automated screenshots upon failure to simplify debugging: `page.screenshot(path="error_checkpoint.png")`.
