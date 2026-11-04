---
trigger: model_decision
description: Apply when changing server-side business logic, APIs, authentication, background jobs, or integrations.
---

# Backend Engineering

- Validate input at trust boundaries.
- Enforce authorization on the server for every protected operation.
- Use consistent error contracts without leaking internals.
- Set timeouts and bounded retries for external calls.
- Use idempotency for retryable operations with side effects.
- Avoid blocking work in request handlers when background processing is appropriate.
- Log correlation IDs and useful metadata, never secrets.
- Version or document breaking API changes.
- Test success, validation failure, authorization failure, timeout, and dependency failure.