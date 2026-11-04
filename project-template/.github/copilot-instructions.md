# Coding Guidelines — Unified APES & Copilot

## Working approach

- Inspect relevant project instructions (`PROJECT.md`, `ARCHITECTURE.md`), domain rules in `.agent/rules/`, and existing conventions before editing.
- Make the smallest complete change that addresses the request; avoid unrelated edits.
- Reuse existing helpers, types, and patterns. Preserve public behavior unless an explicit change is requested.
- Treat user input and external data as untrusted. Validate at system boundaries.
- Report errors through the project's established mechanisms; avoid silently swallowing failures.

## Quality & Verification

- Keep changes readable, type-safe, and appropriately documented.
- Add or update tests for behavior changes and bug fixes (prefer focused regression tests).
- Run the narrowest relevant test, lint, type-check, or build command; report what ran and any limitations.
- Update directly related documentation (`docs/` or README) when behavior, schema, or configuration changes.
- **Do not claim a command or test passed unless it was actually run.**

## Repository & Data Safety

- Review the working tree before editing and preserve unrelated user changes.
- Do not delete, overwrite, or revert user work without explicit approval.
- Never commit secrets, credentials, environment keys, or generated sensitive data.
- Always obtain explicit approval before running destructive operations, migrations against production, or data deletions.
