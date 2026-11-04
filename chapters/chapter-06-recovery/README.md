# Chapter 6 — Undo mistakes and recover lost work

**Goal:** Learn safe recovery choices based on the current Git state. **Use only a disposable practice repository.**

From the companion root:

```bash
bash scripts/new-practice-repo.sh ch06-recovery
cd practice/ch06-recovery
git status
printf 'Draft change\n' >> README.md
git diff
```

## Unstage without discarding the edit

```bash
git add README.md
git restore --staged README.md
git status
git diff
```

If you are sure the change is unnecessary, discard **only this inspected change**:

```bash
git restore README.md
git status
```

## Revert a committed change

```bash
printf '\nA test change\n' >> README.md
git add README.md
git commit -m "Add a test change"
git log --oneline -3
git revert --no-edit HEAD
git log --oneline -3
```

`git revert` creates a new commit undoing the selected commit; it does not erase shared history. Inspect the file and confirm the test text is gone.

## Reflog evidence

```bash
git reflog -6
git status
```

`git reflog` can help locate earlier local branch tips, but availability depends on the repository and its reflog retention. Preserve a located commit on a new branch before other destructive operations.

## Untracked-file preview

```bash
printf 'temporary\n' > scratch.tmp
git clean -nd
```

Preview only. Do not run `git clean -fd` without checking everything it would remove. See [recovery safety](../../docs/TROUBLESHOOTING.md).

**Verify:** `git status`, `git log --oneline --decorate -5`, and inspect file content. Do not run these drills in a work repository.
