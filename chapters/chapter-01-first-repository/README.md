# Chapter 1 — Set up Git and create your first repository

**Manuscript alignment:** Section 1.11, Practice Lab. This is the **primary book exercise**, starting with an empty repository. Chapter 2 continues this exact repository. Do not run these commands inside the published companion repository.

## Preconditions and location

Git and your author identity must be configured (see [Setup](../../docs/SETUP.md)). Run the exercise from your own home directory. Check whether a directory named **git-practice** already exists and inspect it rather than overwriting or deleting it. You may choose a different empty directory; use the same directory in Chapter 2.

## Build — create an empty repository

~~~bash
cd ~
mkdir git-practice
cd git-practice
git init
git branch -M main
git status
~~~

Expected: **main**, no commits yet. The explicit branch rename accommodates Git installations with different initial-branch defaults.

Create the two project files described in the book:

~~~bash
echo "# Git Practice" > README.md
echo "This repository is for learning Git workflows." >> README.md
cat > .gitignore <<'EOF'
.env
*.pem
*.key
.aws/
*.tfstate*
*.log
dist/
build/
node_modules/
.vscode/
.idea/
EOF
touch example.log
git status
git check-ignore -v example.log
~~~

**Observe:** README.md and .gitignore are untracked; example.log is ignored. Ignore rules do not remove secrets already committed to Git history.

## Stage, inspect, commit and verify

~~~bash
git add README.md .gitignore
git status
git diff --cached --check
git diff --cached
git commit -m "Initial project setup"
git log --oneline
git status
git ls-files
~~~

**Verify:** exactly README.md and .gitignore are tracked; the worktree is clean; the ignored log is not committed. The core mental model is **working directory → staging area → repository**.

**Checkpoint:** Leave this repository in place for Chapter 2; do **not** start a fresh project for the next chapter.

## Optional independent exercise

The companion's [starter-project helper](../../scripts/new-practice-repo.sh) creates a different **pre-committed** disposable repository for extra command practice. It is not the starting state for manuscript Section 1.11. To try it, return to the companion root and choose a new name:

~~~bash
bash scripts/new-practice-repo.sh extra-ch01
~~~

**Engineering decision:** inspect the current directory and expected starting state before executing commands. Do not modify the companion repository's own history.
