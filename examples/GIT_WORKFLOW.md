# Git Workflow

## Before work
```bash
git status
git switch -c feature/short-description
```

## After implementation
```bash
git diff --check
git diff
git status
```

Run project-specific checks before committing.

```bash
git add path/to/changed/files
git commit -m "feat: describe behavior"
```

## Rules
- Do not commit secrets, generated artifacts, local databases, or real user data.
- Do not force-push shared branches without coordination.
- Do not rewrite shared history.
- Keep commits focused and reviewable.
