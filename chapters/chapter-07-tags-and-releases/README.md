# Chapter 7 — Identify releases with annotated Git tags

**Manuscript alignment:** Section 7.9. Follow the complete **v0.1.0 → v1.0.0 → v1.0.1** sequence, including post-release main development, the separate maintenance branch and the deliberately mistaken tag. The core exercise needs **no hosted remote**.

## Build — clean, disposable tags-lab

Before creating ~/tags-lab, inspect any existing directory of that name; never overwrite it.

~~~bash
cd ~
mkdir tags-lab
cd tags-lab
git init
git branch -M main
echo "App version 1" > app.txt
git add app.txt
git commit -m "Initial commit"
git status
git log -1 --oneline
~~~

## Tag the initial development checkpoint

~~~bash
git tag -a v0.1.0 -m "Initial development version"
git tag --list
git show v0.1.0
git log --oneline --decorate -2
~~~

**Verify:** v0.1.0 is annotated and points to the initial commit.

## Tag the intended v1.0.0 release

~~~bash
echo "New feature" >> app.txt
git add app.txt
git commit -m "Add new feature"
git status
git log -1 --oneline
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git log --oneline --decorate
~~~

A tag identifies a selected source commit; it does not prove the application was built or deployed.

## Observe tag stability while main advances

~~~bash
echo "Post-release development" >> app.txt
git add app.txt
git commit -m "Continue development"
git log --oneline --decorate -3
git rev-parse v1.0.0^{}
git rev-parse main
~~~

**Verify:** main has moved, but v1.0.0 still identifies the earlier release commit.

## Patch the release line without post-release development

~~~bash
git switch -c maintenance/1.0 v1.0.0
git status
git log -1 --oneline
echo "Bug fix" >> app.txt
git add app.txt
git commit -m "Fix critical bug"
git tag -a v1.0.1 -m "Patch version 1.0.1"
git show v1.0.1
git log --oneline --decorate --all
cat app.txt
~~~

**Verify:** v1.0.1 descends from v1.0.0 and includes the bug fix, **not** the later 'Post-release development' line on main. A maintenance release fixes an earlier release line without silently including unrelated development.

## Create and remove an intentionally mistaken local tag

~~~bash
git tag -a v0.9.0 -m "Mistaken tag"
git tag --list
git tag -d v0.9.0
git tag --list
~~~

The intended three tags remain; the mistaken tag is gone.

## Optional publication to a separate, empty practice remote

Create an empty hosted **tags-lab** remote only if you want to validate permission and tag publication. Replace REMOTE_URL with your **own** empty remote URL; never use the published companion as a destination.

~~~bash
git remote add origin REMOTE_URL
git remote -v
git switch main
git status
git push -u origin main
git push origin v1.0.0
git ls-remote --tags origin
~~~

**Verify:** only v1.0.0 was explicitly published. Publishing tags is a separate decision from creating them locally; release artefacts and deployment outcomes require separate evidence.
