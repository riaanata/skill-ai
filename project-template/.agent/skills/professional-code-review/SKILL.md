---
name: professional-code-review
description: Review a change set for correctness, security, maintainability, performance, and regressions.
---

# Professional Code Review

Inspect the diff and surrounding code. Do not rewrite code during review unless asked.

Review:
- Functional correctness and edge cases
- Authorization and data exposure
- Input validation and injection risks
- Error handling and observability
- Concurrency, transactions, and idempotency
- API/database compatibility
- Performance and resource handling
- Maintainability and unnecessary complexity
- Test coverage and regression risk

For each finding report severity, file/line, evidence, impact, and remediation.
Severity: Critical, High, Medium, Low, Informational.
Do not claim approval while unresolved critical/high findings remain.