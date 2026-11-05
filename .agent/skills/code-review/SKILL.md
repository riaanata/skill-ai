---
name: code-review
description: Review code changes or entire pull requests for correctness, security, architectural integrity, maintainability, and regressions. Supports both quick diff reviews and deep audits.
---

# Code Review — Comprehensive QA, Security & Architecture Audit

A unified code review skill combining rapid diff inspection with deep architectural assessment. Never rewrite code during a review unless explicitly requested.

---

## 1. Operating Modes

### Mode A: Rapid Diff Review (Quick PR Check)
Used for small pull requests, quick bug patches, or localized feature diffs:
1. Identify the exact diff and relevant surrounding code.
2. Verify functional correctness, clean code naming, and edge case handling.
3. Check for obvious regressions, missing tests, or untyped inputs.
4. Report actionable findings concisely without blocking trivial style preferences.

### Mode B: Deep Architectural Audit (Principal-Level Review)
Used for critical milestones, core refactors, or security-sensitive modules:
1. **Functional Correctness & Edge Cases:** Trace inputs through callers, boundaries, and asynchronous state.
2. **Security & Authorization:** Audit OWASP risks, auth bypasses, session hijacking, injection vulnerabilities, and sensitive data leakage.
3. **Data Integrity & Concurrency:** Inspect database transactions, race conditions, idempotency, and schema migrations.
4. **Performance & Scalability:** Detect N+1 queries, memory leaks, unindexed queries, and excessive re-renders.
5. **Observability & Error Handling:** Ensure errors are logged with context and never swallowed silently.

---

## 2. Reporting Standard & Severity Classification

For each actionable finding, provide:
- **Severity Level:**
  - `🚨 Critical`: Security vulnerabilities, data loss, or blocking production crashes.
  - `⚠️ High`: Functional regressions, memory leaks, or unhandled major edge cases.
  - `⚡ Medium`: Performance bottlenecks, missing validation, or lack of regression test coverage.
  - `💡 Low / Info`: Minor maintainability improvements, naming clarity, or code deduplication.
- **Location:** File path and exact line range (`file.ext#L10-L15`).
- **Impact & Evidence:** Clear explanation of what will break and under what conditions.
- **Recommended Remediation:** Concrete code snippet showing the minimal safe fix.

*Do not claim approval while unresolved Critical or High findings remain.*
