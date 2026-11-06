# Chapter 5 — Compare merge, rebase and conflict resolution

**Manuscript alignment:** Section 5.8 uses **merge-rebase-lab**; Section 5.9 uses a separate **conflict-lab**. These are two **disposable local repositories**, never the published companion or a shared branch.

## Section 5.8 — comparable merge and rebase histories

Check for an existing ~/merge-rebase-lab before creating it; choose a different name if it already contains work.

~~~bash
cd ~
mkdir merge-rebase-lab
cd merge-rebase-lab
git init
git branch -M main
echo "Base line" > notes.txt
git add notes.txt
git commit -m "Initial commit"
git status

git switch -c feature/merge-test
echo "Feature line" >> notes.txt
git add notes.txt
git commit -m "Add feature line"
git log -1 --format="%h %s"

git switch main
git switch -c feature/rebase-test
echo "Feature line" > rebase-note.txt
git add rebase-note.txt
git commit -m "Add rebase feature line"
git log -1 --format="%h %s"

git switch main
echo "Main branch update" > main.txt
git add main.txt
git commit -m "Add main branch update"
git log --oneline --graph --decorate --all
~~~

**Observe:** two feature histories were created before main advanced. Note the feature commit IDs before changing history.

~~~bash
git switch feature/merge-test
git status
git merge --no-edit main
git log --oneline --graph --decorate --all

git switch feature/rebase-test
git status
git log -1 --format="%h %s"
git rebase main
git log -1 --format="%h %s"
git log --oneline --graph main feature/rebase-test
git status
~~~

**Verify:** the merge retains the original feature commit identity and adds an integration commit; the rebase **replays** its unshared feature commit onto main with a new SHA. Do not apply this rebase practice to published commits depended on by others.

## Section 5.9 — deliberate conflict and exact resolution

Check for an existing ~/conflict-lab; never overwrite it. Create a **separate** repository:

~~~bash
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
git log --oneline --graph --decorate --all
git merge feature/conflict
~~~

**Expected break:** the merge stops with an unmerged file; this is an intentional, useful failure. Inspect before editing:

~~~bash
git status
cat file.txt
~~~

The required **final** file has **exactly these two lines in this order**, with no conflict markers:

~~~text
Main branch content
Feature branch content
~~~

Edit the file to the intended resolution (the following command is **only** for this disposable conflict-lab):

~~~bash
printf 'Main branch content\nFeature branch content\n' > file.txt
cat file.txt
git add file.txt
git diff --cached --check
git diff --cached
git status
git commit -m "Resolve merge conflict"
git log --oneline --graph --decorate --all
git status
cat file.txt
~~~

**Verify:** file.txt contains both lines, the merge commit has two parents and Git reports a clean working tree. The lab follows **Build → Observe → Break → Diagnose → Fix → Verify**.

The companion's older environment=stage conflict is a separate *optional* example. Use the two-line conflict above for the actual book exercise.
