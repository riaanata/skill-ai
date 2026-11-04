---
name: project-audit
description: Audit an existing repository's architecture, code quality, security posture, tests, and technical debt without changing application code.
---

# Project Audit

## Procedure
1. Read project instructions and docs.
2. Inspect repository structure, package manifests, lockfiles, and runtime versions.
3. Map major modules and data flows.
4. Inspect authentication, authorization, input validation, and secret handling.
5. Inspect database schema, migrations, and query patterns where available.
6. Inspect tests, CI, build, deployment, logging, and backup practices.
7. Identify inconsistencies between docs and implementation.

## Output
Create or update `docs/PROJECT_AUDIT.md` with:
- Scope and limitations
- Architecture summary
- Findings with severity and evidence
- Technical debt
- Test/CI gaps
- Prioritized remediation plan

Do not modify application code during the audit unless explicitly asked.