---
trigger: model_decision
description: Apply when designing or changing HTTP, RPC, webhook, or event contracts.
---

# API and Integration Contracts

- Define request, response, error, and authentication contracts.
- Validate payloads and enforce size/time limits.
- Document pagination, filtering, sorting, and versioning.
- Use idempotency for side-effecting retryable operations.
- Verify webhook signatures and prevent replay where supported.
- Apply bounded retries with backoff and timeouts.
- Avoid leaking internal stack traces.
- Add contract or integration tests.
- Update API documentation and examples.