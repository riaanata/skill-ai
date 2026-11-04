---
trigger: model_decision
description: Apply when changing identity, permissions, sessions, secrets, uploads, integrations, sensitive data, or security controls.
---

# Application Security

Threat-model the feature and trust boundaries.

Review applicable risks:
- Broken access control
- Injection
- XSS and CSRF
- SSRF
- Authentication/session weaknesses
- Insecure file upload
- Sensitive data exposure
- Unsafe deserialization
- Rate-limit and abuse gaps
- Vulnerable dependencies and misconfiguration

Rules:
- Deny by default; least privilege.
- Authorize every server-side resource action.
- Keep secrets in approved secret storage.
- Never log tokens, passwords, API keys, or sensitive payloads.
- Use secure cookies and session rotation/revocation where applicable.
- Validate file type, size, content, and storage location.
- Do not run intrusive tests against third-party systems without authorization.
- Report severity, evidence, impact, and remediation.