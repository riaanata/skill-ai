---
name: implement-feature
description: "Plan and implement a requested software feature end to end. Use when asked to add behavior, build a component, create an API, or extend an existing application."
---

# Implement a Feature

1. Restate the expected behavior and identify acceptance criteria from the request.
2. Inspect the relevant modules, tests, and established patterns. Check the working tree before editing.
3. Trace the full user-facing path, including UI, service/API, persistence, and errors where applicable.
4. Implement the smallest complete change using existing types and helpers. Avoid unrelated cleanup.
5. Add or update tests for the new behavior and edge cases.
6. Update directly related documentation or configuration if the feature changes them.
7. Run targeted tests and the relevant type-check, lint, or build command.
8. Review the final diff for unintended changes; summarize files changed, behavior, and validation results.

If requirements are materially ambiguous, ask a focused question before choosing behavior. Otherwise use the simplest reasonable interpretation and state it.
