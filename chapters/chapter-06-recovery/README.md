# 06 — Recovery drills

**Safety:** use a **new disposable** `~/recovery-lab` directory; the commands deliberately amend, reset and clean practice files. Check for an existing directory and never overwrite work.

```bash
cd ~
mkdir recovery-lab
cd recovery-lab
git init
git branch -M main
echo "Line 1" > file.txt
git add file.txt
git commit -m "Initial commit"
git status
```

## Inspect and discard one unstaged edit

```bash
echo "Temporary change" >> file.txt
git diff
git restore file.txt
git status
```

## Unstage without discarding content

```bash
echo "Another change" >> file.txt
git add file.txt
git diff --cached
git restore --staged file.txt
git diff
git restore file.txt
git status
```

## Amend a local unshared commit

```bash
echo "Amend practice" >> file.txt
git add file.txt
git commit -m "Wrong message"
git log -1 --oneline
git commit --amend -m "Add amend practice"
git log -1 --oneline
```

## Soft reset and scoped cleanup

```bash
echo "This will be undone" >> file.txt
git add file.txt
git commit -m "Bad commit"
git reset --soft HEAD~1
git status
git diff --cached
```

Only after confirming you are still in the disposable `recovery-lab` and all pending content is disposable:

```bash
git reset --hard HEAD
git status
```

## Recover a lost commit

```bash
echo "This commit will be lost" >> file.txt
git add file.txt
git commit -m "Commit to recover"
LOST_COMMIT=$(git rev-parse HEAD)
git reset --hard HEAD~1
git reflog
git branch recovered-work "$LOST_COMMIT"
git log -1 --oneline recovered-work
git show recovered-work:file.txt
```

## Revert a change while retaining history

```bash
echo "Revert this test edit" >> file.txt
git add file.txt
git commit -m "Add edit to revert"
git revert --no-edit HEAD
git log --oneline -4
git status
```

## Preview removal of an untracked practice file

```bash
echo "temporary" > scratch.tmp
git clean -nd
git status --short
```

Only if the preview shows this known disposable file:

```bash
git clean -fd -- scratch.tmp
git status
```

**Expected:** recovered-work names the rescued commit, revert preserved history, and the worktree is clean after inspected cleanup. Never use these history-changing steps in this examples repository.
