---
name: secret-leak-scanner
description: Audit source code, environment configs, and git diffs to detect and prevent hardcoded secrets, private keys, database credentials, and API tokens.
---

# Secret & Credential Leak Scanner

## 1. Pre-Commit Credential Audit
Always scan affected files and git status before committing changes. Flag any occurrence of:
- High-entropy strings and raw API keys (e.g. OpenAI `sk-...`, Google AI Studio `AIzaSy...`, AWS `AKIA...`).
- Private keys (`BEGIN RSA PRIVATE KEY`, `BEGIN OPENSSH PRIVATE KEY`).
- Database connection strings containing passwords (`postgres://user:pass@host...`, `mongodb+srv://...`).
- Hardcoded JWTs, bearer tokens, or user passwords.

## 2. Environment Variable Hygiene
- All sensitive configurations must reside exclusively in `.env.local` or environment variables.
- Verify that `.gitignore` explicitly includes:
  ```text
  .env
  .env.*
  *.pem
  *.key
  secrets/
  ```
- Always maintain an unpopulated `.env.example` documenting required variable names without real values.

## 3. Remediation Protocol
- If a secret is accidentally discovered in tracked source files:
  1. Immediately notify the user to rotate/revoke the key.
  2. Move the credential to the appropriate local environment file.
  3. Replace the code reference with `process.env.VAR_NAME` or `os.getenv("VAR_NAME")`.
