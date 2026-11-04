---
name: code-review
description: "Review a code change for actionable defects, regressions, and maintainability risks. Use when asked to review a diff, pull request, or implementation."
---

# Code Review

1. Identify the exact diff and relevant surrounding code; do not assume the change is isolated from its callers.
2. Trace changed behavior through its important call sites and data boundaries.
3. Prioritize concrete correctness, security, data-loss, compatibility, and test-coverage issues over style preferences.
4. For each finding, provide severity, file and line, a concise explanation of impact, and the conditions needed to trigger it.
5. Report only actionable findings supported by evidence. Do not silently modify code during a review.
6. If no actionable issues are found, say so and mention any validation not performed.

Avoid reporting speculative concerns or restating intended behavior as a defect.
