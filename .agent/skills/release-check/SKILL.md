---
name: release-check
description: Verify build, tests, security, migrations, configuration, deployment, and rollback readiness before release.
---

# Release Check

Verify:
- Scope and changelog
- Build, lint, typecheck
- Unit, integration, and critical E2E tests
- Dependency/security checks available in the project
- Environment variables and secret injection
- Database migration and backup/restore plan
- API compatibility
- Logging, metrics, health checks
- Deployment and rollback instructions
- Known limitations and operational owner

Create `docs/RELEASE_REPORT.md`.
Verdict must be one of READY, READY WITH WARNINGS, or NOT READY, supported by actual evidence.
Never deploy production without explicit approval.