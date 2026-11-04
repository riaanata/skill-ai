---
trigger: model_decision
description: Apply when implementing features, fixing bugs, refactoring, or changing test infrastructure.
---

# Testing and QA

- Add tests for expected behavior and edge cases.
- Prefer deterministic tests with isolated dependencies.
- Unit-test pure business logic.
- Integration-test persistence and service boundaries.
- E2E-test critical user journeys.
- Include authorization and invalid-input cases.
- Avoid tests that depend on production services or real credentials.
- Never delete/skip a failing test just to obtain a green run.
- Report exact commands, counts, failures, and skipped tests.
- If tests cannot run, explain why and state what remains unverified.