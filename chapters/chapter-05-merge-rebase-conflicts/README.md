# 05 — Merge, rebase and conflict resolution

Use **two new local disposable directories**. Do not run these exercises in a project with shared history. Inspect existing paths before creating them.

## A. Compare merge and rebase

```bash
cd ~
mkdir merge-rebase-lab
cd merge-rebase-lab
git init
git branch -M main
echo "Base line" > notes.txt
git add notes.txt
git commit -m "Initial commit"
git switch -c feature/merge-test
echo "Feature line" >> notes.txt
git add notes.txt
git commit -m "Add feature line"
git switch main
git switch -c feature/rebase-test
echo "Feature line" > rebase-note.txt
git add rebase-note.txt
git commit -m "Add rebase feature line"
git switch main
echo "Main branch update" > main.txt
git add main.txt
git commit -m "Add main branch update"
git log --oneline --graph --decorate --all
```

Compare histories before and after integration:

```bash
git switch feature/merge-test
git merge --no-edit main
git log --oneline --graph --decorate --all
git switch feature/rebase-test
git log -1 --format='%H %s'
git rebase main
git log -1 --format='%H %s'
git log --oneline --graph --decorate --all
git status
```

**Expected:** merge retains the original feature commit; rebase creates a new commit ID for the replayed feature change.

## B. Create and repair a conflict

```bash
cd ~
mkdir conflict-lab
cd conflict-lab
git init
git branch -M main
echo "Initial content" > file.txt
git add file.txt
git commit -m "Initial commit"
git switch -c feature/conflict
echo "Feature branch content" > file.txt
git add file.txt
git commit -m "Feature branch change"
git switch main
echo "Main branch content" > file.txt
git add file.txt
git commit -m "Main branch change"
```

The next command is **expected to stop with a conflict**. It is not a successful merge:

```bash
git merge feature/conflict || echo "Expected merge conflict"
git status
cat file.txt
```

Repair the conflict in this disposable repository and verify:

```bash
printf 'Main branch content\nFeature branch content\n' > file.txt
cat file.txt
git add file.txt
git diff --cached --check
git commit -m "Resolve merge conflict"
git status
git log --oneline --graph --decorate --all
git show --format='%P' --no-patch HEAD
```

**Expected:** `file.txt` has exactly the two lines shown, a clean worktree and a two-parent merge commit. Do not use `git reset --hard` as a blanket conflict fix.
