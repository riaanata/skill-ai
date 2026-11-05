---
name: bedah-desain-video
description: Reverse engineer rekaman video/reels medsos UI/UX menjadi sistem desain, arsitektur halaman, hierarki komponen, dan blueprint kode AI 13-tahap (A–M).
---

# Bedah Desain Video — Video UI/UX Reverse Engineering SOP

A specialized skill for Senior UI/UX Designers, Product Analysts, Software Architects, and Full-Stack Developers. It transforms reference video recordings (walkthroughs, social media reels, screencasts, UI demos) into production-ready implementation blueprints and AI coding prompts.

---

## 1. Operating Protocol & Anti-Hallucination Gate

Before writing a single line of code or drafting specs:
1. **Full Video Decomposition:** Inspect the entire video timeline from start to finish. Capture the keyframes, transitions, and interactions.
2. **Evidence-Based Extraction:** Only document features, components, and layout structures that are visually evident or logically required.
3. **Explicit Uncertainty Tagging:** Separate directly visible elements from architectural recommendations or assumptions (place assumptions in Section M).
4. **Visual Fidelity Preservation:** Retain the exact color palettes, elevation shadows, corner radii, typography scale, and micro-interactions of the reference.

---

## 2. The 13-Stage Master Blueprint Output (A to M)

Whenever this skill is triggered, you MUST produce an exhaustive report adhering strictly to this 13-stage structure:

### A. Ringkasan Hasil Analisis Video
- **Identitas Sumber:** URL/ID video, kreator, dan platform.
- **Tujuan Aplikasi:** Domain produk (SaaS, FinTech, E-Commerce, AI, Admin Tool).
- **Karakter Visual Utama:** Gaya desain (Bento Grid, Glassmorphism, Claymorphism, Clean Minimalist, Neon Dark).
- **Core Value Proposition:** Masalah yang diselesaikan antarmuka dan daya tarik utamanya.

### B. Daftar Halaman dan Penjelasannya
- Buat daftar lengkap seluruh halaman yang muncul atau terhubung dalam aplikasi.
- Untuk setiap halaman dokumentasikan:
  - **Nama & Rute Halaman** (misal: `/dashboard`, `/analytics`, `/users`).
  - **Fungsi Utama:** Tujuan halaman bagi pengguna.
  - **Struktur Layout:** Penempatan sidebar, header, kontainer data, dan footer.
  - **Komponen Utama:** Kartu metrik, tabel, grafik, modal, atau form.
  - **Hubungan Navigasi:** Bagaimana halaman ini diakses dan ke mana pengguna bisa berpindah.

### C. Detail Desain UI/UX
- **Palet Warna:** Hex code untuk Canvas, Surface, Primary Brand, Accents, Borders, dan Typography (Light & Dark).
- **Tipografi:** Font family, scale (Display, H1-H3, Body, Caption), line-height, dan letter-spacing.
- **Spacing & Alignment:** Menggunakan grid 8px (padding `16px/24px`, gap `16px/24px`).
- **Corner Radii & Borders:** Nilai `border-radius` (squircle `16-24px`, inner `10-12px`, pill `9999px`) dan border stroke 1px.
- **Elevation & Shadows:** Spesifikasi `box-shadow` berlapis (*soft ambient diffusion*).
- **Gaya Navigasi & Kontrol:** Desain sidebar, navbar, tabs, button variants, dan form inputs.

### D. Daftar Fitur dan Cara Kerjanya
Kelompokkan seluruh fitur ke dalam kategori berikut:
- **A. Fitur Utama:** Dashboard analytics, visualisasi data, CRUD inti.
- **B. Fitur Tambahan:** Filter periode, export data, status badge.
- **C. Fitur Navigasi:** Menu aktif dengan kapsul kontras, breadcrumbs, routing dinamis.
- **D. Fitur Pencarian & Filter:** Global search (`Ctrl+K`), live search table, dropdown sorting.
- **E. Fitur Autentikasi & Pengaturan:** Login, OTP verification modal, profil switcher.
- **F. Fitur Animasi & Motion:** Staggered entry, chart stroke drawing, hover glow, spring popups.

### E. User Flow & Diagram Interaksi
- Alur langkah-demi-langkah interaksi pengguna dari membuka aplikasi hingga menyelesaikan task.
- Buat diagram alur tekstual terstruktur atau SVG arsitektur bersih menggunakan prinsip `diagram-design`.

### F. Ekstraksi Komponen UI (Atomic & Reusable)
- Pohon hierarki komponen frontend (Layout, Organisms, Molecules, Atoms).
- Identifikasi komponen yang dapat digunakan ulang (*reusable*) beserta daftar props-nya.

### G. Master Design System Tokens
- Format siap pakai untuk `tailwind.config.js` atau CSS Variables (`:root`).
- State komprehensif: Default, Hover, Active, Focus, Disabled, Loading, dan Empty states.

### H. Responsive Design Matrix
- Strategi adaptasi 4 ukuran layar: Desktop (`>=1280px`), Laptop (`1024-1279px`), Tablet (`768-1023px`), Smartphone (`<768px`).
- Perilaku khusus mobile: Drawer sidebar, table card conversion, chart touch tooltips.

### I. Rekomendasi Arsitektur Teknologi
- **Frontend Framework:** Next.js / React / Vue / Vite.
- **Styling:** Tailwind CSS + Radix / Shadcn UI.
- **Visualisasi Data:** Recharts / Chart.js / D3.
- **Animation Engine:** Framer Motion / Lucide Icons.
- **State Management:** Zustand / TanStack Query.

### J. Struktur Database dan Backend (Full-Stack Blueprint)
- Skema tabel SQL (nama tabel, primary key UUID, foreign keys, tipe data, indeks).
- Daftar RESTful atau RPC API Endpoints dengan format request dan response JSON.
- Kebijakan keamanan, otentikasi (JWT / Session), dan validasi schema (Zod).

### K. Blueprint Pengembangan Bertahap (Phased Roadmap)
- Rencana implementasi bertahap (Phase 1: Setup & Design System -> Phase 2: Layout & Navigation -> Phase 3: Core Dashboard & Charts -> Phase 4: Full Interactivity & Polish).

### L. Prompt Final untuk AI Coding
- Prompt matang dan siap salin (*copy-paste ready*) yang dapat dimasukkan ke asisten AI coding mana pun untuk mengimplementasikan antarmuka secara presisi.

### M. Daftar Bagian yang Perlu Dikonfirmasi
- Catat asumsi yang belum terbukti dari video (misal: simbol mata uang, sumber data asli, format respons backend).

---

## 3. Workflow Trigger Prompt Template

Jika pengguna memberikan tautan video atau instruksi singkat, gunakan formula respons berikut:
> *"Memulai dekomposisi video UI/UX menggunakan skill bedah-desain-video. Mengekstraksi keyframes, palet warna, hierarki komponen, dan menyusun blueprint 13-tahap (A–M)..."*
