# Chapter 1 — Set up Git and create your first repository

**Goal:** Understand the working tree, staging area and commits. Learn to inspect before changing anything.

**Starting state:** Git is installed and an author name and email are configured. Run commands from the **companion repository root** unless a step says to enter the practice directory.

## Create an isolated practice project

```bash
bash scripts/new-practice-repo.sh ch01-first-repo
cd practice/ch01-first-repo
git status
git log --oneline -3
```

The script created a new, independent Git repository with its first commit. The working tree should be clean and the branch should be `main`.

## Make and inspect a change

```bash
printf '\n## Getting started\n' >> README.md
git status
git diff
git add README.md
git diff --staged
git commit -m "Document getting started"
git log --oneline -3
```

Expected: the README changed, the change appeared in the staging diff, and Git created a second commit.

## Practise unstaging without losing work

```bash
printf '\nOne more note.\n' >> README.md
git add README.md
git restore --staged README.md
git status
git diff
```

The edit should remain in the working file but no longer be staged. Keep or commit the edit deliberately.

## Check secret exclusion

```bash
printf 'local-test-only\n' > .env
git check-ignore -v .env
git status --short
```

`.env` should be ignored. Git ignore rules do **not** remove sensitive values already committed to history.

**Finish:** `git status`, `git log --oneline -3`. Work only inside this disposable practice directory. Return to the companion root with `cd ../..`.
