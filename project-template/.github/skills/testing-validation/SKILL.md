---
name: testing-validation
description: "Select and run appropriate tests, type checks, lint, or builds to validate a change. Use when asked to test, verify, diagnose CI, or confirm a fix."
---

# Testing and Validation

1. Inspect the project manifests and existing test conventions to identify supported commands.
2. Map each changed behavior to the smallest relevant test or validation command.
3. Run focused tests first; run broader checks when the change crosses boundaries or focused results warrant it.
4. For failures, distinguish regressions from environment/setup issues and investigate the relevant output.
5. Do not modify unrelated code merely to make a pre-existing check pass.
6. Report exact commands and outcomes. Clearly label checks that were not run and why.

For behavior changes, prefer tests that assert observable outcomes and important edge cases rather than implementation details.
