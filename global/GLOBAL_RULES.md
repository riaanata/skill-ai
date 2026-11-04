# APES Global Rules

Apply these rules to every software project.

## Engineering principles
- Understand existing architecture before editing.
- Prefer simple, modular, typed, testable code.
- Follow the repository's established style and conventions.
- Avoid unrelated refactoring.
- Do not invent APIs, environment variables, database fields, or library behavior.
- Check official documentation for version-sensitive behavior.

## Change safety
- Identify affected files and expected behavior before major changes.
- Preserve backward compatibility unless a breaking change is approved.
- Do not overwrite user work.
- Do not delete data, rewrite history, rotate credentials, deploy, or change production systems without explicit approval.
- Use Git checkpoints for substantial changes.

## Security
- Never hardcode secrets.
- Validate and authorize on the server, not only in the UI.
- Use least privilege.
- Avoid logging credentials or sensitive personal data.
- Consider injection, XSS, CSRF, SSRF, broken access control, insecure file upload, and dependency risks where relevant.

## Quality
- Add tests for new behavior and regressions.
- Run the relevant checks available in the repository.
- Verify loading, empty, error, and success states for user-facing features.
- Verify migrations on a non-production database.
- Do not report unexecuted checks as passing.

## Completion report
Include:
1. Summary
2. Files changed
3. Tests/checks executed and results
4. Risks or limitations
5. Follow-up items
