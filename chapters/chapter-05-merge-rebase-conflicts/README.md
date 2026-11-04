# Chapter 5 — Compare merge, rebase and conflict resolution

**Goal:** Understand how Git combines histories, and diagnose a conflict without guessing.

Create a fresh isolated repository from the companion root:

```bash
bash scripts/new-practice-repo.sh ch05-conflict
cd practice/ch05-conflict
printf 'environment=dev\n' > settings.txt
git add settings.txt
git commit -m "Add environment setting"
git switch -c feature/update-environment
printf 'environment=stage\n' > settings.txt
git commit -am "Change environment for feature"
git switch main
printf 'environment=test\n' > settings.txt
git commit -am "Change main environment setting"
```

Now intentionally trigger a **conflict** inside this disposable repository:

```bash
git merge feature/update-environment
```

This merge is expected to stop with conflict markers. Read the evidence before editing:

```bash
git status
git diff
cat settings.txt
```

Decide which setting is intended. For this exercise, choose `stage`, then finish the merge:

```bash
printf 'environment=stage\n' > settings.txt
git add settings.txt
git commit -m "Resolve environment setting conflict"
git log --oneline --graph --all -7
git status
```

## Rebase comparison

Create a **second disposable repository** for rebase practice; do not rebase already shared history. Use `git switch -c`, advance both branches separately, then compare `git merge` with `git rebase main` on an unshared feature branch. Inspect `git log --graph` before and after; rebase produces **new commit identities** for replayed commits.

**Safety:** while a conflict is unresolved, `git merge --abort` or `git rebase --abort` can return you to the pre-operation state when permitted. Do not use `git reset --hard` as a blanket conflict fix.
