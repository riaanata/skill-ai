---
trigger: model_decision
description: Apply when changing Docker, infrastructure, CI/CD, environment configuration, deployment, observability, or backups.
---

# DevOps and Reliability

- Keep environments separated: local, test, staging, production.
- Use reproducible builds and lockfiles.
- Pin critical action/container versions where practical.
- Never commit secrets.
- Run containers as non-root where practical.
- Minimize image size and exposed ports.
- Add health checks and structured logs.
- Use resource limits where appropriate.
- Document deployment and rollback.
- Require approval before production deployment or infrastructure destruction.
- Verify backup restore procedures, not just backup creation.