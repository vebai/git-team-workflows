# Chapter 2 — Work with commits, branches and history

**Manuscript alignment:** Section 2.17, Practice Lab. **Continue the git-practice repository from Chapter 1**, with its initial commit and clean main branch. Do not create a replacement pre-committed project for the primary exercise.

## Preconditions — inspect before branching

~~~bash
cd ~/git-practice
git status
git branch --show-current
git log --oneline -3
~~~

If you used a different Chapter 1 folder name, enter that directory instead. Confirm the worktree is clean and main exists; if you are on another branch, return using git switch main. Stop if the expected Chapter 1 commit is missing.

## Build — isolate feature work

~~~bash
git switch -c feature/add-team-notes
git branch --show-current
echo "Team workflow notes" > team-notes.md
git status
git add team-notes.md
git commit -m "Add team notes file"
echo "Use branches for separate work." >> team-notes.md
git add team-notes.md
git commit -m "Add branch workflow note"
~~~

**Observe:** main has not moved. The feature branch contains two new commits. Inspect the branch graph before making any integration decision.

~~~bash
git log --oneline --graph --decorate --all
git log main..feature/add-team-notes --oneline
git diff main...feature/add-team-notes
~~~

## Prove branch isolation — an expected failure

~~~bash
git switch main
git branch --show-current
cat team-notes.md
~~~

The cat command is **expected to report that the file does not exist** on main. This is evidence of two different committed project states, not a broken lab. Never create a replacement file on main to silence this message.

Return to the feature branch and verify both lines:

~~~bash
git switch feature/add-team-notes
cat team-notes.md
git status
git log --oneline --graph --decorate --all
~~~

Expected content:

~~~text
Team workflow notes
Use branches for separate work.
~~~

**Decision rule:** a branch identifies a line of history; switching branches changes which committed snapshot is checked out. Do not merge this exercise into main unless explicitly practising a separate integration later.

## Optional independent starter

If you want an isolated companion-only example, [new-practice-repo.sh](../../scripts/new-practice-repo.sh) can create a fresh practice repository. That optional path has a **different starting state and names** and does not replace the book's Chapter 1 → Chapter 2 continuity.
