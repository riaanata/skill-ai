# 🧠 Skill AI — Master Agent Skills, Rules & Creator Workflows

> Koleksi lengkap 23 Production-Grade Agent Skills, 9 Domain Rules, Master Design System (`DESIGN.md`), dan Protocol Tata Kelola AI (`AGENTS.md`) untuk **Google Antigravity, Claude Code, Cursor, Codex, dan Gemini CLI**.

---

## 🌟 Ikhtisar (Overview)

Repositori ini mengubah AI coding agent dari sekadar *generator kode biasa* menjadi **Principal Software Engineer & Full-Stack Content Creator**:
* ✅ **Evidence-Based:** Dilarang mengklaim hasil tes sebelum benar-benar dijalankan di terminal.
* ✅ **Anti-Rationalization (Addy Osmani Protocol):** Menolak segala bentuk jalan pintas AI yang menunda testing, dokumentasi, atau penanganan error.
* ✅ **Minimal & Safe (Ponytail Philosophy):** Mencegah over-engineering, menolak dependensi berlebih, dan mengutamakan perubahan terkecil yang aman.
* ✅ **Master Design System (`DESIGN.md`):** Mencegah *AI Slop Design* dengan standar visual 9 dimensi yang konsisten dan elegan.
* ✅ **Editorial Diagram Standard (`diagram-design`):** Menyingkirkan *Mermaid slop* dengan SVG vektor tajam, skema arsitektur profesional, dan viewer HTML interaktif.
* ✅ **Content Creator Pipeline:** Dari penulisan naskah viral, potong video FFmpeg, subtitel karaoke otomatis, pembuatan thumbnail, hingga upload otomatis ke media sosial.

---

## 📦 Katalog 23 Modular Agent Skills (`.agent/skills/`)

Setiap skill berformat standar `SKILL.md` dengan *YAML frontmatter* dan bekerja menggunakan mekanisme **Progressive Disclosure** (hanya dimuat ke konteks AI saat dibutuhkan):

### 1. 🛠️ Software Engineering, Arsitektur & Desain Sistem
* **`diagram-design`**: Standar diagram arsitektur editorial publikasi (45 tipe diagram) dalam format vector SVG murni dan preview HTML interaktif pan/zoom — menyingkirkan *Mermaid slop*.
* **`implement-feature`**: SOP pembuatan fitur end-to-end (spesifikasi, implementasi minimal, unit test).
* **`advanced-debugging`**: Investigasi akar masalah (*root cause*), reproduksi bug, dan penambahan uji regresi.
* **`debug-fix`**: Perbaikan cepat untuk error runtime atau compiler tanpa efek samping.
* **`professional-code-review`**: Tinjauan mendalam kualitas kode, arsitektur, dan celah teknis.
* **`code-review`**: Review cepat PR / diff git terhadap standar clean code.
* **`refactor-code`**: Refaktorisasi aman berpandu tes tanpa mengubah perilaku eksternal.
* **`testing-validation`**: Penulisan dan eksekusi test suite komprehensif (Unit, Integration, E2E).
* **`project-audit`**: Audit arsitektur, dependensi, dan utang teknis repositori tanpa mengubah kode aplikasi.
* **`release-check`**: Checklist kelayakan rilis dan verifikasi pra-produksi.

### 2. 🕷️ Web Scraping, Otomasi & Reverse Engineering
* **`web-scraper-advanced`**: Scraping tangguh anti-blokir Cloudflare, rotasi header browser realistis, dan parsing payload JSON tersembunyi.
* **`browser-automation`**: Otomasi browser siluman (*stealth*) Playwright/Puppeteer dengan simulasi jeda ketik dan gerak mouse manusia.
* **`api-reverse-engineering`**: Membedah endpoint API tersembunyi dari DevTools/cURL dan merekonstruksi auth token ke dalam client SDK yang rapi.

### 3. 📈 Data Pasar & Finansial
* **`financial-data-pipeline`**: Pengolahan data time-series OHLCV, agregasi multi-timeframe, dan perhitungan indikator teknikal (RSI, MACD, Moving Average, Bollinger Bands) untuk charting.

### 4. 🎬 Video, Audio, Penulisan Artikel & Desain Kreator
* **`humanizer`**: Menghapus bau robot (*AI tells*), jargon klise, dan menghasilkan artikel yang mengalir alami, lolos AI detector, serta ramah SEO Google (berbasis Wikipedia AI Cleanup).
* **`ffmpeg-media-pipeline`**: Otomasi potong video instan tanpa re-encode, konversi rasio 16:9 ke 9:16 vertikal (TikTok/Reels), dan ekstraksi audio 16kHz Whisper.
* **`auto-subtitle-generator`**: Transkripsi audio lokal otomatis via **Whisper AI** dan pembakaran teks (*burn-in*) subtitel animasi bergaya karaoke.
* **`thumbnail-designer`**: Standar visual thumbnail YouTube (1280x720) dan cover TikTok (1080x1920) berdaya klik tinggi (*High CTR*) via Python Pillow.
* **`viral-script-writer`**: Penulisan naskah video pendek berdaya tonton tinggi (*High Retention*) dengan formula Hook 3 detik pertama dan visual cues.
* **`social-media-publisher`**: Otomasi publikasi video ke TikTok, Instagram Reels, dan YouTube Shorts via Playwright dan YouTube Data API v3 resmi.

### 5. 🗄️ Database, Infrastruktur & Keamanan
* **`database-migration`**: Prosedur migrasi skema database aman zero-downtime (*expand-migrate-contract*) dengan jaminan backup.
* **`sqlite-wal-optimization`**: Tuning performa database SQLite lokal (mode WAL) agar anti-error "database locked" pada bot dan scraper.
* **`secret-leak-scanner`**: Audit otomatis pencegah kebocoran API key, password database, dan private key sebelum commit ke Git.

---

## 🛡️ 9 Aturan Domain Spesialis (`.agent/rules/`)

Aturan modular dengan trigger cerdas (`model_decision` & `always_on`):
1. **`00-core.md`**: Aturan dasar anti-halusinasi dan etika kerja engineer (Always on).
2. **`security.md`**: Mitigasi risiko OWASP Top 10, sanitasi input, dan otorisasi server-side.
3. **`database.md`**: Standar integritas data, efisiensi query, dan pencegahan N+1 problem.
4. **`testing.md`**: Standar cakupan tes dan verifikasi kondisi error/empty/loading.
5. **`backend.md`**: Arsitektur server, modularitas, dan penanganan exception terpusat.
6. **`frontend.md`**: UI responsif, state management, dan performa render.
7. **`api-contracts.md`**: Standarisasi format REST/JSON, error code, dan versioning.
8. **`performance.md`**: Audit beban komputasi, caching, dan bottleneck I/O.
9. **`devops.md`**: Docker, CI/CD pipeline, dan isolasi lingkungan staging/produksi.

---

## 🎨 Master Design System (`DESIGN.md`)

Menyediakan standar 9 dimensi UI/UX kelas dunia:
* **Atmosphere:** Clean, modern, high-contrast SaaS aesthetic.
* **Color System:** Semantic tokens (Surface, Text, Border, Status) berbasis Tailwind CSS.
* **Typography:** Skala tipografi geometris (Inter / Plus Jakarta Sans) yang proporsional.
* **8-Point Grid:** Spacing simetris kelipatan 4px/8px.
* **Component Standards:** Standar tombol, form input, data tables, dan cards.
* **Anti-Patterns:** Melarang gradien ungu murahan dan teks abu-abu yang tidak terbaca.

---

## 🚀 Cara Pemasangan & Penggunaan

### A. Untuk 1 Proyek Tertentu
Salin folder `.agent/`, berkas `AGENTS.md`, dan `DESIGN.md` ke folder root proyek Anda:
```bash
cp -r .agent /path/to/your-project/
cp AGENTS.md /path/to/your-project/
cp DESIGN.md /path/to/your-project/
```

### B. Untuk Seluruh Proyek Sekaligus (Global / Folder Induk)
Tempatkan berkas `AGENTS.md`, `DESIGN.md`, dan folder `.agent/` langsung di folder induk yang menampung semua repositori Anda (misal: `D:\Projects\` atau `H:\projek\`). Antigravity dan agen AI akan otomatis mendeteksi dan menerapkannya ke semua sub-folder!

---

## 📄 Lisensi
MIT License © 2026 [Ria Anata](https://github.com/riaanata).
