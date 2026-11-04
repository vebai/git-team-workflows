# Chapter 2 — Work with commits, branches and history

**Goal:** See that branches identify lines of work and commits preserve snapshots.

**Starting state:** From the companion repository root, create a fresh practice repository.

```bash
bash scripts/new-practice-repo.sh ch02-branches
cd practice/ch02-branches
git switch -c feature/update-notes
printf '\n- Feature work in progress.\n' >> docs/notes.md
git add docs/notes.md
git commit -m "Record feature notes"
```

Inspect the current branch and its commits:

```bash
git status
git branch --show-current
git log --oneline --decorate --graph --all -5
git log --oneline main..feature/update-notes
git diff main...feature/update-notes
```

Switch to `main` and inspect the files:

```bash
git switch main
git status
cat docs/notes.md
git switch feature/update-notes
cat docs/notes.md
```

The feature note appears only when the feature branch is checked out. Inspecting `git log` and `git diff` explains the difference before a merge.

**Verify:** `git branch -avv`, `git log --graph --all --oneline`. The branch remains local. No shared history has been changed.
