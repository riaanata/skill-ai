---
name: git-github-workflow
description: Automate Git and GitHub operations including semantic conventional commits, branch management, merge conflict resolution, pre-push secret and big-file inspection, and release tagging.
---

# Git & GitHub Workflow — Automated Version Control & DevOps SOP

A comprehensive, production-grade skill for orchestrating Git and GitHub operations. Follow this workflow to ensure clean commit histories, eliminate accidental secret leaks, resolve merge conflicts safely, and publish verified releases.

---

## 1. Safety & Pre-Push Pre-Flight Protocol

Before running any `git add` or `git push`, you MUST perform a pre-flight inspection:

### Mandatory Rules
1. **Never Force Push to Protected Branches:** Never run `git push --force` or `-f` on `main`, `master`, or `production`.
2. **Pre-Push Secret & Asset Shield:** Verify that no sensitive files or heavy binaries are staged:
   - Secret files: `.env`, `.env.*`, `*.pem`, `*.key`, `id_rsa`, `credentials.json`, `service-account*.json`.
   - Dependency & build artifacts: `node_modules/`, `dist/`, `build/`, `.venv/`, `__pycache__/`, `.next/`.
   - Large media/binary files: Video clips, zip archives, SQLite `.db`, or any file > 50 MB (use `.gitignore` or Git LFS instead).
3. **Evidence-Based Reporting:** Always execute the git command in the terminal and report the exact exit code and commit hash. Never fabricate commit success.

---

## 2. Conventional Commit Specification

All commit messages MUST adhere to the **Conventional Commits 1.0.0** specification.

### Structure
```text
<type>(<optional scope>): <imperative short description>

[optional body explaining WHY and WHAT changed]

[optional footer: Closes #123, Breaking Changes]
```

### Commit Types
| Type | When to Use | Example |
|---|---|---|
| `feat` | Adding a new user-facing feature or skill | `feat(skills): add git-github-workflow automation SOP` |
| `fix` | Bug fix or regression repair | `fix(auth): prevent token expiration race condition` |
| `refactor`| Code change that neither fixes a bug nor adds a feature | `refactor(db): streamline query builder abstraction` |
| `perf` | Code change that improves performance | `perf(sqlite): enable WAL mode and 64MB cache` |
| `docs` | Documentation only changes | `docs(readme): update skill catalog and cheat sheet` |
| `test` | Adding missing tests or correcting existing tests | `test(api): add integration test for webhook payload` |
| `chore` | Build process, auxiliary tools, or dependency updates | `chore(deps): bump vite from 5.1.0 to 5.2.0` |
| `ci` | CI/CD configuration files and scripts | `ci(github): add automated unit test workflow` |
| `style` | Formatting, missing semi-colons, no code logic changes | `style(ui): align table padding with design tokens` |

---

## 3. The One-Command "Push to GitHub" SOP

When the user asks to "push to github", "commit dan push", or "git sync", execute this exact 5-step sequence:

```powershell
# Step 1: Inspect modified and untracked files
git status --short

# Step 2: Ensure branch is up to date with remote
git pull --rebase origin <branch_name>

# Step 3: Stage specific or verified safe files
git add <target_files_or_directories>

# Step 4: Commit with a semantic message reflecting actual diff
git commit -m "<type>(<scope>): <concise action description>"

# Step 5: Push to remote tracking branch
git push origin <branch_name>

# Step 6: Verify latest commit
git log -1 --stat
```

---

## 4. Branch Management & Feature Flow

### Branch Naming Conventions
- New feature: `feature/<short-name>` (e.g. `feature/dark-mode`)
- Bug fix: `fix/<issue-name>` (e.g. `fix/login-redirect`)
- Hotfix for production: `hotfix/<critical-bug>`
- Release preparation: `release/vX.Y.Z`

### Workflow Routine
```powershell
# 1. Create and switch to new branch
git checkout -b feature/awesome-feature

# 2. Perform work, stage, and commit
git add .
git commit -m "feat(module): implement awesome feature"

# 3. Keep branch synced with main
git checkout main
git pull origin main
git checkout feature/awesome-feature
git rebase main

# 4. Push feature branch to GitHub
git push -u origin feature/awesome-feature
```

---

## 5. Safe Merge Conflict Resolution

When a conflict occurs during `git pull`, `git merge`, or `git rebase`:

1. **Locate Conflicted Files:**
   ```powershell
   git status
   ```
   Look for files listed under *"Both modified"*.

2. **Inspect Conflict Markers:**
   Each conflicted section looks like:
   ```text
   <<<<<<< HEAD (Current change)
   const apiUrl = "https://api.v1.example.com";
   =======
   const apiUrl = "https://api.v2.example.com";
   >>>>>>> origin/main (Incoming change)
   ```

3. **Resolve Logically:**
   - Keep the correct code or merge both intents cleanly.
   - Delete all markers: `<<<<<<<`, `=======`, and `>>>>>>>`.

4. **Verify & Complete:**
   ```powershell
   # Run tests or linting to confirm zero syntax breakage
   npm test # or pytest / cargo test

   # Stage resolved file
   git add <resolved-file>

   # Continue rebase or complete merge commit
   git rebase --continue # or git commit
   ```

---

## 6. Git Disaster Recovery (Emergency Toolkit)

### A. "I accidentally committed, but want to keep my edits"
```powershell
# Undoes the last commit, keeps all changes staged in working directory
git reset --soft HEAD~1
```

### B. "I accidentally modified a tracked file and want to discard changes"
```powershell
git restore <path/to/file>
```

### C. "I want to unstage a file staged with git add"
```powershell
git restore --staged <path/to/file>
```

### D. "I lost a commit or accidentally deleted a branch"
```powershell
# 1. View entire history of HEAD movements
git reflog

# 2. Recover the lost state into a new branch
git checkout -b recovered-work <commit_hash_from_reflog>
```

### E. "Clean untracked files safely"
```powershell
# Step 1: Dry-run to preview what will be deleted
git clean -n -d

# Step 2: Actually remove untracked files after confirmation
git clean -f -d
```

---

## 7. Semantic Versioning & GitHub Releases

When publishing a major, minor, or patch milestone:

1. **Tag Creation:**
   ```powershell
   git tag -a v1.0.0 -m "Release v1.0.0: Initial production release"
   git push origin v1.0.0
   ```

2. **Changelog Generation:**
   List all commits since the last release tag:
   ```powershell
   git log $(git describe --tags --abbrev=0 2>$null)..HEAD --oneline
   ```
   Group changes by `Features`, `Bug Fixes`, and `Chores/Refactors` in `CHANGELOG.md`.
