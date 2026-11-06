# Chapter 6 — Recover safely from common Git mistakes

**Manuscript alignment:** Section 6.10, Practice Lab. Run **only in a new disposable recovery-lab repository**. These commands deliberately alter history and include scoped use of git reset --hard and git clean; never aim them at a work or companion repository.

## Preconditions and safe starting state

Inspect ~/recovery-lab before creating it. If present, select a different empty folder; **do not delete or overwrite existing work**.

~~~bash
cd ~
mkdir recovery-lab
cd recovery-lab
git init
git branch -M main
echo "Line 1" > file.txt
git add file.txt
git commit -m "Initial commit"
git status
git branch --show-current
git log --oneline --decorate -3
~~~

## Step 1 — discard only an inspected unstaged change

~~~bash
echo "Temporary change" >> file.txt
git status
git diff
git restore file.txt
git diff
git status
cat file.txt
~~~

Expected: file.txt returns to **Line 1** and the worktree is clean.

## Step 2 — unstage without losing content

~~~bash
echo "Another change" >> file.txt
git add file.txt
git diff --cached
git restore --staged file.txt
git status
git diff
git restore file.txt
git status
~~~

Expected: after unstaging, the edit remains in the working file; the final restore discards only this inspected practice edit.

## Step 3 — amend a local, unshared commit

~~~bash
echo "Amend practice" >> file.txt
git add file.txt
git commit -m "Wrong message"
git log -1 --oneline
git commit --amend -m "Add amend practice"
git log -1 --oneline
git status
~~~

Expected: revised message and **new commit SHA**; unchanged intended content.

## Step 4 — soft reset retains staged changes

~~~bash
echo "This will be undone" >> file.txt
git add file.txt
git commit -m "Bad commit"
git log --oneline -3
git reset --soft HEAD~1
git status
git diff --cached
~~~

The 'Bad commit' no longer names the branch tip, but its changes remain staged. **Only after confirming this is the disposable lab and no changes must be preserved**, clean up the known practice edits:

~~~bash
git reset --hard HEAD
git status
~~~

## Step 5 — use reflog to rescue an unreachable commit

~~~bash
echo "This commit will be lost" >> file.txt
git add file.txt
git commit -m "Commit to recover"
git log -1 --oneline
git reset --hard HEAD~1
git reflog
~~~

Find the SHA of **Commit to recover** in the actual reflog. Substitute that SHA below; **RECOVERED_COMMIT_ID** is a placeholder, not a literal Git revision.

~~~bash
git branch recovered-work RECOVERED_COMMIT_ID
git log -1 --oneline recovered-work
git show recovered-work:file.txt
~~~

Expected: the recovered branch preserves the otherwise lost commit and the file contains 'This commit will be lost'. There is no need to rewrite main.

## Step 6 — revert without erasing history

~~~bash
echo "Revert this test edit" >> file.txt
git add file.txt
git commit -m "Add edit to revert"
git revert --no-edit HEAD
git log --oneline -4
git status
~~~

Expected: revert **adds** a new commit; the original commit remains in history.

## Step 7 — preview before cleaning untracked files

~~~bash
echo "temporary" > scratch.tmp
git clean -nd
git status --short
~~~

Only if the preview identifies **exactly** this disposable scratch file, remove it deliberately:

~~~bash
git clean -fd -- scratch.tmp
git status
~~~

**Decision rule:** identify whether the unwanted content is unstaged, staged, committed or merely unreachable, then use the **smallest justified recovery action** and verify what survived. The earlier abbreviated companion example is optional; this guide now includes the complete manuscript recovery sequence.
