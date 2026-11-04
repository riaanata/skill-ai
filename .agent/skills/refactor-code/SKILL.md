---
name: refactor-code
description: "Improve code structure while preserving externally observable behavior. Use for simplification, deduplication, modularization, or readability improvements."
---

# Refactor Code

1. Confirm the requested scope and inspect callers, tests, and existing architecture.
2. Identify the structural problem and define what behavior must remain unchanged.
3. Check existing utilities and patterns before introducing a helper or abstraction.
4. Make incremental, behavior-preserving edits; do not combine unrelated feature changes.
5. Add or adjust tests only where needed to lock down behavior that might otherwise change.
6. Run relevant tests and type-check/build commands.
7. Review the diff for scope creep and summarize the structural improvement and validation.
