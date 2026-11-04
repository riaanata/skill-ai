# APES — Antigravity Professional Engineering System (Unified Edition)

Paket konfigurasi dan skill rekayasa perangkat lunak untuk meningkatkan disiplin kerja AI Coding Agent (**Google Antigravity** dan **VS Code GitHub Copilot**) pada Windows, dengan cakupan **Global + Project**.

## Isi paket

- `global/` — template aturan global dan prompt lintas proyek untuk Antigravity.
- `project-template/` — template proyek terpadu (*dual-compatible*):
  - `.agent/rules/` — aturan domain teknis (Security, Database, DevOps, Testing, API, Frontend, Backend, Performance).
  - `.agent/skills/` — 8 modul prosedur kerja untuk Antigravity Agent.
  - `.github/copilot-instructions.md` — pedoman umum untuk VS Code Copilot Workspace.
  - `.github/skills/` — 8 modul skill yang kompatibel dengan slash commands Copilot.
  - `docs/`, `prompts/`, `templates/` — arsitektur, checklist, dan template pelaporan.
  - `AGENTS.md`, `GEMINI.md`, `PROJECT.md`, `ARCHITECTURE.md` — instruksi dan konteks proyek.
- `install/` — skrip PowerShell untuk instalasi template global (`copy-global-template.ps1`) dan template proyek (`copy-project-template.ps1`).
- `examples/` — contoh checklist Definition of Done dan Git workflow.
- `MANIFEST.md` — daftar seluruh file paket.

## 8 Skill Inti yang Disediakan

1. **`implement-feature`** — Siklus 8 langkah penambahan fitur dari spesifikasi hingga verifikasi diff.
2. **`debug-fix` / `advanced-debugging`** — Investigasi akar masalah (*RCA*) tanpa penutupan gejala semu (*anti-symptom-patching*) & penulisan tes regresi.
3. **`code-review` / `professional-code-review`** — Tinjauan perubahan berbasis bukti dan tingkat keparahan (*Correctness > Security > Data Loss > Style*).
4. **`testing-validation`** — Eksekusi pengujian terarah dan pemisahan isu regresi vs *setup environment*.
5. **`refactor-code`** — Restrukturisasi kode dengan penjagaan ketat pada perilaku eksternal (*behavior-preserving*).
6. **`database-migration`** — Perencanaan migrasi skema/data aman dengan strategi *expand-migrate-contract* dan verifikasi *backup*.
7. **`project-audit`** — Audit arsitektur, keamanan, utang teknis, dan celah pengujian repository secara *read-only*.
8. **`release-check`** — Verifikasi kesiapan rilis (build, lint, migrasi, konfigurasi rahasia, rollback plan).

## Prinsip Penting

1. **Global** berisi preferensi kerja umum, bukan instruksi spesifik stack.
2. **Project** berisi aturan teknis dan business logic proyek tertentu.
3. Aturan yang lebih spesifik tidak boleh bertentangan dengan aturan global.
4. Selalu tinjau diff dan perubahan file sebelum menyetujui tindakan agent.
5. Jangan memberi akses tanpa batas ke terminal, filesystem, database, secrets, atau deployment.
6. **AI tidak boleh mengklaim test/build berhasil jika perintahnya belum benar-benar dijalankan.**
7. **AI dilarang menutupi bug dengan exception handling longgar atau fallback sukses semu.**

## Instalasi Windows

### A. Persiapan
1. Pastikan Git terpasang dan proyek sudah berada di repository Git.
2. Ekstrak ZIP atau letakkan repositori ini di lokasi tetap, misalnya `H:\antigraviti new projek\skil coding`.

### B. Global Setup (Untuk Antigravity)
1. Buka Antigravity $\rightarrow$ Settings / Customizations $\rightarrow$ Rules / Global Rules.
2. Salin isi `global\GLOBAL_RULES.md` ke Global Rules.
3. Atau gunakan skrip PowerShell:
   ```powershell
   .\install\copy-global-template.ps1 -Destination "C:\Path\To\Your\GlobalConfig"
   ```

### C. Menerapkan ke Proyek (Baru atau Eksisting)
Gunakan skrip otomasi yang disediakan:
```powershell
.\install\copy-project-template.ps1 -Destination "H:\path\ke\proyek-anda"
```
Atau salin folder `project-template` secara manual ke root proyek Anda:
- Folder `.agent` dan `AGENTS.md` akan otomatis terbaca oleh **Google Antigravity**.
- Folder `.github` akan otomatis terbaca oleh **VS Code GitHub Copilot**.
- Isi dan sesuaikan `PROJECT.md`, `ARCHITECTURE.md`, dan `docs/TECH_STACK.md` sesuai kebutuhan proyek Anda.

### D. Validasi Setelah Instalasi
Minta agent:
- Membaca instruksi global dan project;
- Merangkum aturan dan skill yang aktif;
- Memeriksa struktur repository tanpa mengubah file;
- Menyebutkan rencana file yang akan diubah sebelum implementasi.

## Keamanan

- Jangan pernah menaruh API key, password, token, private key, atau credential di file Rules/Skills.
- Gunakan `.env.local` atau secret manager yang sesuai dan pastikan masuk `.gitignore`.
- Gunakan database development/staging untuk eksperimen.
- Selalu backup sebelum migrasi database.
- Minta persetujuan eksplisit sebelum operasi destruktif, transaksi finansial, atau deployment production.
