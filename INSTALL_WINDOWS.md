# Instalasi APES di Windows

## 1. Ekstrak paket

Ekstrak `APES_Antigravity_Professional_Engineering_System.zip`, misalnya ke:

`C:\Tools\APES`

## 2. Pasang aturan global

Lokasi global Antigravity dapat berbeda antarversi. Jangan mengasumsikan lokasi internal.

- Buka Antigravity.
- Buka Settings / Customizations / Rules (nama menu dapat berubah).
- Gunakan fitur open/reveal config folder bila tersedia.
- Tambahkan isi `global/GLOBAL_RULES.md` ke Global Rules.
- Simpan `global/GLOBAL_PROMPT.md` sebagai prompt referensi.

`global/AGENTS.md` adalah alternatif satu-file untuk agent yang membaca AGENTS.md dari konteks global. Jangan mengaktifkan dua sumber global identik jika berpotensi menghasilkan instruksi duplikat.

## 3. Terapkan template ke proyek

Gunakan skrip otomasi yang disediakan:

```powershell
.\install\copy-project-template.ps1 -Destination "D:\Projects\NamaProyek"
```

Atau salin manual untuk proyek baru:

```powershell
Copy-Item "C:\Tools\APES\project-template\*" "D:\Projects\NamaProyek" -Recurse -Force
```

Untuk proyek yang sudah ada, salin file/folder yang diperlukan secara selektif. Jangan menimpa file README, package.json, konfigurasi build, atau aturan yang sudah dimiliki proyek tanpa review.

## 4. Jalankan pemeriksaan awal

Di terminal PowerShell:

```powershell
Set-Location "D:\Projects\NamaProyek"
git status
git init # hanya jika proyek belum menjadi repository Git
```

Jika repository sudah ada, jangan jalankan `git init` lagi.

Buat checkpoint:

```powershell
git add .
git commit -m "chore: add APES project guidance"
```

Jika belum ada identitas Git, atur `user.name` dan `user.email` terlebih dahulu.

## 5. Prompt validasi

Tempel prompt dari `project-template/prompts/00-onboarding-and-audit.md`.

## 6. Opsional: salin template global dengan PowerShell

Skrip `install/copy-global-template.ps1` hanya menyalin file template ke folder tujuan yang Anda tentukan. Skrip tidak menebak lokasi Antigravity dan tidak mengubah konfigurasi aplikasi secara otomatis.

Contoh:

```powershell
.\install\copy-global-template.ps1 -Destination "D:\AI-Config\APES-Global"
```
