# Project Agent Instructions — APES

This file is the primary project-level guidance. Replace placeholders in `PROJECT.md`.

## First read
Before significant work, inspect:
- `PROJECT.md`
- `ARCHITECTURE.md`
- `docs/TECH_STACK.md`
- `docs/API.md` when API work is involved
- `docs/DATABASE.md` when data work is involved
- applicable files in `.agent/rules/`
- available skills in `.agent/skills/` or `.github/skills/` (e.g. `implement-feature`, `debug-fix`, `code-review`, `testing-validation`, `refactor-code`, `database-migration`, `project-audit`, `release-check`)
- `.github/copilot-instructions.md` if working via VS Code Copilot

## Project-specific behavior
- Treat current code and tests as the source of truth for implemented behavior.
- Do not assume documentation is current; identify discrepancies.
- Do not replace existing libraries or frameworks without a reason and approval.
- Keep business logic out of UI components where practical.
- Keep API contracts and database schema changes synchronized.
- Update documentation when behavior, configuration, API, or deployment changes.

## Task protocol
For small, low-risk tasks: inspect, implement, test, report.
For cross-module or high-risk tasks: analyze, plan, wait for approval where appropriate, implement in stages, test, review.

## Database and production safety
- Use local/development data by default.
- Never run destructive migrations against production without explicit approval and a verified backup/recovery plan.
- Never print secrets or sensitive records.

## Definition of done
- Requested behavior is implemented.
- Relevant tests pass, or failures are explicitly reported.
- Typecheck/lint/build are run when available and relevant.
- No unrelated changes remain.
- Docs and examples are updated where needed.
- Final report lists evidence and known limitations.
