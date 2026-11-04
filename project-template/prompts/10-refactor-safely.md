# Prompt — Safe Refactoring

Refactor: [MODULE / GOAL]

First document current behavior and tests. Identify callers, public interfaces, data contracts, and side effects. State the intended structural improvement and compatibility plan.

Preserve behavior unless a behavior change is explicitly requested. Work in small steps, add characterization/regression tests, avoid unrelated formatting or dependency changes, and compare before/after behavior. Run all relevant checks and report the diff and evidence.