# 02 — Branches and history

**Starting state:** Continue the clean `~/git-practice` repository from exercise 01. If your practice directory has a different name, substitute its real path.

```bash
cd ~/git-practice
git status
git switch main
git log --oneline -3
git switch -c feature/add-team-notes
printf 'Team workflow notes\n' > team-notes.md
git add team-notes.md
git commit -m "Add team notes file"
printf 'Use branches for separate work.\n' >> team-notes.md
git add team-notes.md
git commit -m "Add branch workflow note"
git log --oneline --graph --decorate --all
git log --oneline main..feature/add-team-notes
git diff main...feature/add-team-notes
```

Check that the file is absent from `main`:

```bash
git switch main
git status
if [ -e team-notes.md ]; then
  echo "UNEXPECTED: team-notes.md exists on main"
  exit 1
else
  echo "EXPECTED: team-notes.md is absent on main"
fi
```

Return to your feature branch:

```bash
git switch feature/add-team-notes
cat team-notes.md
git status
```

**Expected:** two feature commits, `main` unchanged, and both notes visible only on the feature branch. Do not push these exercise branches to the examples repository.
