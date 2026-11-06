# Chapter 3 — Connect local work to a practice remote

**Manuscript alignment:** Section 3.13, Practice Lab. The **primary** book path uses an empty GitHub repository named **remote-practice**, or an authorised organisation-provided equivalent. A local bare-remote simulation remains an optional alternative.

The book's practice remote is **not** the published [Git Team Workflows companion](../../README.md). Readers must never push exercise history or tags to the public companion.

## Preconditions — choose and inspect the remote

Create a new **empty** hosted practice repository under an account you control. Do not initialise it with a README, licence or .gitignore. Verify the owner and URL. Use HTTPS (as in the book) or your organisation's approved method. Configure Git author identity and authenticate via a credential manager or approved SSH setup; do not paste tokens into commands or commit them.

Before creating a local directory, inspect whether ~/remote-practice already exists; choose another directory such as ~/remote-practice-local if needed. The following example assumes the default name is available.

## Build and push main

~~~bash
cd ~
mkdir remote-practice
cd remote-practice
git init
git branch -M main
echo "# Remote Practice" > README.md
git add README.md
git commit -m "Initial commit"
git status
git branch --show-current
~~~

Copy the actual remote URL from your hosting platform. Replace YOUR-USERNAME in the following example; the public companion repository must not be substituted.

~~~bash
git remote add origin https://github.com/YOUR-USERNAME/remote-practice.git
git remote -v
git push -u origin main
~~~

**Verify:** the hosted remote shows the committed README; main tracks origin/main.

## Deliberately create remote-only history

On the hosting platform, edit README.md directly on **remote main** and append this exact line, committing it through the web interface:

~~~text
Remote change for pull practice.
~~~

Before pulling, local main must still point to the previous commit. On your computer:

~~~bash
git fetch origin
git log --oneline --graph --decorate --all
cat README.md
~~~

**Observe:** origin/main has advanced, but local main and README.md have not changed. Fetch updates remote-tracking knowledge, not the checked-out working file.

~~~bash
git switch main
git pull --ff-only origin main
cat README.md
git status
~~~

**Verify:** README.md now contains the remote-only line. If a fast-forward is refused, stop and inspect; do not force-push or reset merely to complete the exercise.

## Create the branch used in Chapter 4

~~~bash
git switch -c feature/add-note
echo "This repository is connected to a remote." >> README.md
git add README.md
git commit -m "Update README"
git push -u origin feature/add-note
git fetch origin
git branch -r
git remote -v
git status
~~~

Expected remote-tracking names include origin/main and origin/feature/add-note. **Keep this branch and remote intact**: Chapter 4 reviews and merges precisely this work.

## Optional offline alternative

If GitHub or GitLab authentication is unavailable, use the companion's local-bare-remote exercise or the extended validation kit to practise the **fetch → inspect → pull** Git semantics offline. A bare remote does not prove HTTPS/SSH authentication, web editing or hosted permissions. Record those evidence limits.
