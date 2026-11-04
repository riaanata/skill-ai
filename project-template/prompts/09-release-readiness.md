# Prompt — Production Release Readiness

Assess the proposed release without deploying.

Verify scope, diff, changelog, build, lint, typecheck, tests, dependency audit, secrets, configuration, migration safety, backup/restore, observability, health checks, deployment steps, and rollback.

Create `docs/RELEASE_REPORT.md`. Verdict: READY, READY WITH WARNINGS, or NOT READY. Support every claim with actual evidence. List unrun checks and residual risks. Do not deploy or modify production without explicit approval.