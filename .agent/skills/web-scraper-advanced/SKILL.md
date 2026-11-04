---
name: web-scraper-advanced
description: Build resilient, stealthy, and structured web scrapers that handle dynamic JS rendering, anti-bot mechanisms, rate limits, and clean data parsing.
---

# Advanced Web Scraping & Data Extraction

## 1. Inspection & Strategy Selection
- **Static vs Dynamic:** First inspect if the page embeds pre-rendered JSON (e.g. `<script id="__NEXT_DATA__">`, hydration payloads, or internal REST/GraphQL endpoints). Always prefer hidden JSON APIs over parsing fragile HTML DOM.
- **Network Tab Inspection:** Check XHR/Fetch requests in DevTools before attempting full headless browser automation.

## 2. Anti-Bot & Fingerprint Defense
- **Browser Headers:** Always supply realistic browser headers:
  - `User-Agent`: Modern Chrome/Edge string.
  - `Accept`, `Accept-Language` (`id-ID,id;q=0.9,en-US;q=0.8`), `Sec-Ch-Ua`, `Sec-Fetch-Dest`.
- **Throttling & Backoff:** Add randomized delays between requests (e.g. 1.5s - 3.5s) to avoid triggering IP rate limits.
- **Session Management:** Maintain cookies across requests using persistent session objects (`requests.Session()` or `httpx.Client()`).

## 3. Data Extraction & Normalization
- Extract and validate data against a strict schema (e.g., Pydantic or TypeScript interfaces).
- Handle missing fields gracefully with explicit defaults; never let a single missing element crash the scraper loop.
- Sanitize extracted text: strip excess whitespace, unescape HTML entities, parse prices into clean integers/floats.

## 4. Failure Recovery & Checkpointing
- Implement exponential backoff on HTTP 429 (Too Many Requests) and 503.
- Save progress iteratively (e.g., SQLite or JSONL checkpointing) so interrupted scraping jobs can resume without re-fetching existing records.
