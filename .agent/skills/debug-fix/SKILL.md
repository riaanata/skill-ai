---
name: debug-fix
description: "Diagnose and fix a software bug by tracing evidence to its root cause. Use for errors, regressions, crashes, incorrect output, or broken workflows."
---

# Debug and Fix

1. Reproduce the reported issue when possible; capture the exact error, inputs, and expected versus actual result.
2. Trace the failing path through callers, state, and relevant dependencies. Search for prior handling of similar cases.
3. Form a root-cause hypothesis based on evidence, then confirm it with a focused test, inspection, or reproduction.
4. Make a surgical fix at the source of the defect, preserving unrelated behavior.
5. Add a regression test that fails before the fix and passes after it when practical.
6. Run the focused regression test and any directly relevant validation.
7. Review for adjacent failure cases introduced by the fix and report results, including any unresolved limitation.

Do not hide the symptom with broad exception handling, silent defaults, or success-shaped fallback behavior.
