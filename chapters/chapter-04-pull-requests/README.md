# 04 — Review and merge a pull request

**Starting state:** continue the same `remote-practice` project and pushed `feature/add-note` branch from exercise 03. Do not start another repository for this exercise.

```bash
cd ~/remote-practice
git status
git remote -v
git fetch origin
git branch -avv
```

**Hosted step:** Open a PR/MR on **your practice remote** with source `feature/add-note` and target `main`. Title: `Update README with remote connection note`. Inspect the diff, commits, checks and permitted merge method.

Add a clarification to the existing branch and push it:

```bash
git switch feature/add-note
git status
echo "Changes are reviewed before merging into main." >> README.md
git diff
git add README.md
git diff --cached
git commit -m "Clarify remote connection note"
git push
```

**Hosted step:** Reopen the same PR/MR. Confirm the new commit appears. Review any rules or required checks. Merge only when permitted. A self-created change is not an independent approval.

Once the hosting interface confirms the PR/MR is merged:

```bash
git switch main
git fetch origin
git log --oneline --graph --decorate --all
git merge --ff-only origin/main
cat README.md
git status
git branch -vv
```

**Expected:** both documentation lines are present on `main`, and your worktree is clean. If `git merge --ff-only` fails, inspect divergent history and do not reset to make it pass.
