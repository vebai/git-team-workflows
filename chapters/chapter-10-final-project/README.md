# Chapter 10 — Complete a safe Git team workflow

**Goal:** Connect the entire process: **Prepare → Branch → Change → Inspect → Share → Review → Verify → Integrate → Confirm → Tag → Verify → Clean up**.

**Starting state:** A **new disposable hosted** GitHub/GitLab repository that you own, initialised with a README and `main` branch. Use a hosted repository so that PR/MR and review steps are real. Do **not** push to the public book companion repository.

## 1. Prepare and branch

```bash
cd ~
git clone YOUR_PRACTICE_REMOTE_URL git-team-final
cd git-team-final
git status
git branch --show-current
git pull --ff-only origin main
git switch -c docs/contribution-guide
```

Replace `YOUR_PRACTICE_REMOTE_URL` with the address of your own disposable practice repository. If `git-team-final` already exists, choose another directory name instead of overwriting it.

## 2. Change, inspect and share

```bash
printf '# Contributing\n\nOpen a focused pull request for changes.\n' > CONTRIBUTING.md
git diff -- CONTRIBUTING.md
git status
git add CONTRIBUTING.md
git diff --staged
git commit -m "Add contribution guide"
git push -u origin docs/contribution-guide
```

`git diff` by itself does not show untracked files. Before staging, `git status` identifies the new file; **after** `git add`, `git diff --staged` shows its contents.

## 3. Review and integrate

Open a PR/MR from `docs/contribution-guide` into `main`. Use [the review description example](../../examples/review/PULL_REQUEST.example.md), inspect the actual diff and make one additional commit in response to practice feedback. Observe the updated PR.

Check approvals, CI status and branch protection before merging. For a solo learning repository, simulated review is not independently enforced approval. Merge through the host-supported method when allowed.

## 4. Confirm the integrated state and tag

```bash
git switch main
git pull --ff-only origin main
git status
git log -1 --oneline
git ls-files CONTRIBUTING.md
git tag -a v1.0.0 -m "Practice team release 1.0.0"
git show --no-patch v1.0.0
```

Only after confirming the tag points at the intended commit, and that the remote is your **own disposable repository**, publish the tag:

```bash
git remote -v
git push origin v1.0.0
git ls-remote --tags origin
```

Tag publication does **not** demonstrate that CI/CD built or deployed anything.

## 5. Cleanup

Check that the feature changes exist on `main` and the remote tag is correct. Only then remove a fully merged **local** feature branch if you still have it:

```bash
git branch --merged main
git branch -d docs/contribution-guide
```

If Git says the branch does not exist, no action is needed. Use the host's interface if you choose to remove the **remote** feature branch.

**Verify:** describe what changed, what was reviewed, which commit was integrated, which tag identifies the release and what (if anything) CI actually ran.
