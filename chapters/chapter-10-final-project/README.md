# 10 — Complete team workflow

**Starting state:** a **separate, disposable hosted** repository you control, initialised with README.md and main. Create a local directory named `git-team-final` only if that path is available. Replace `YOUR_PRACTICE_REMOTE_URL` with its actual URL.

## Prepare and branch

```bash
cd ~
git clone YOUR_PRACTICE_REMOTE_URL git-team-final
cd git-team-final
git remote -v
git status
git switch main
git fetch origin
git merge --ff-only origin/main
git switch -c feature/add-contributing-guide
```

## Create, inspect and publish the change

```bash
cat > CONTRIBUTING.md <<'EOF'
# Contributing to This Project

Thank you for considering contributing to this project.

## How to Contribute
1. Create a feature branch.
2. Make your changes.
3. Inspect and commit the intended changes.
4. Push the feature branch.
5. Open a pull request or merge request.
6. Respond to review feedback.
7. Integrate when requirements are met.
EOF
git status
git add CONTRIBUTING.md
git diff --cached --check
git diff --cached
git commit -m "Add contribution guidelines"
git diff main...HEAD
git push -u origin feature/add-contributing-guide
```

**Hosted step:** Open a PR/MR from `feature/add-contributing-guide` into `main`, inspect the diff and check state, and ask for review where required.

## Respond to feedback on the same branch

```bash
cat >> CONTRIBUTING.md <<'EOF'

## Reporting Issues
If you find a bug, include:
- a clear description of the problem;
- steps to reproduce the issue; and
- the expected and actual behaviour.
EOF
git diff
git add CONTRIBUTING.md
git diff --cached
git commit -m "Add issue reporting guidance"
git push
```

**Hosted step:** Confirm that the original PR/MR now shows the added commit. Inspect all required checks and approvals; self-review is not independent approval. Merge when the hosting platform permits it.

## Verify integration and publish a practice tag

Only after the PR/MR is reported **merged**:

```bash
git switch main
git fetch origin
git log --oneline --graph --decorate --all
git merge --ff-only origin/main
git status
cat CONTRIBUTING.md
git log -1 --oneline
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git remote -v
git push origin v1.0.0
git ls-remote --tags origin v1.0.0
```

**Expected:** main contains both sections and the remote tag identifies the selected merged commit. Publishing a tag is not a deployment.

## Optional cleanup

```bash
git branch --show-current
git status
git branch --merged main
git branch -d feature/add-contributing-guide
```

If the host used squash merge, Git may not regard the local branch as merged; inspect carefully before any further deletion. Do not force-delete work merely to finish the exercise.
