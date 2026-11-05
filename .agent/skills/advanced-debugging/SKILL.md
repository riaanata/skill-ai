---
name: advanced-debugging
description: Diagnose, reproduce, and fix software defects by tracing evidence to root causes. Covers rapid bug fixes, complex investigations, and regression test authoring.
---

# Advanced Debugging & Bug Fix — Root-Cause Investigation & Repair SOP

A unified engineering skill for reproducing errors, uncovering root causes, implementing surgical fixes, and verifying regressions. Never suppress exceptions with silent fallbacks as a substitute for fixing the true defect.

---

## 1. Operating Modes

### Mode A: Rapid Triage & Surgical Hotfix (Quick Fix)
Used when the error is deterministic, local, or has a clear stack trace:
1. Capture the exact error message, stack trace, and failing input.
2. Trace directly to the failing line of code.
3. Make the smallest, surgical change that fixes the defect without touching unrelated lines.
4. Run the affected function or test to prove resolution.

### Mode B: Deep Root-Cause Investigation (Complex / Intermittent Bugs)
Used for elusive bugs, concurrency races, memory leaks, or intermittent CI failures:
1. **Safe Reproduction:** Build a minimal, reproducible test case capturing exact environment, inputs, and state.
2. **Path Tracing:** Trace execution across callers, state transitions, and external services.
3. **Hypothesis Formulation & Evidence Testing:** Formulate a specific hypothesis on the defect mechanism and confirm it via isolated assertions or targeted debug logs.
4. **Surgical Implementation:** Apply the root-cause fix at the source of the issue, avoiding broad exception catching or silent defaults.
5. **Mandatory Regression Test:** Add an automated unit or integration test that **fails before the fix** and **passes after it**.
6. **Side-Effect Review:** Inspect adjacent modules and boundary conditions to ensure zero secondary regressions.

---

## 2. Hard Anti-Patterns (Strictly Forbidden)
- ❌ Do not wrap failing code in generic `try/catch` blocks that silently swallow errors.
- ❌ Do not weaken validation schemas or disable assertions just to make a test pass.
- ❌ Do not claim a bug is fixed without running the reproduction test in the terminal.
