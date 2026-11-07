# 03 — Hosted remotes, fetch, pull and push

**Starting state:** an **empty, separate** GitHub or GitLab repository named `remote-practice` under an account you control. Create it in the hosting interface **without** README, licence or ignore file. Check that `~/remote-practice` does not already contain work.

```bash
cd ~
mkdir remote-practice
cd remote-practice
git init
git branch -M main
echo "# Remote Practice" > README.md
git add README.md
git commit -m "Initial commit"
git status
```

Replace `YOUR-USERNAME` with the owner of your empty practice remote. Verify the URL **before** pushing:

```bash
git remote add origin https://github.com/YOUR-USERNAME/remote-practice.git
git remote -v
git push -u origin main
```

**Hosted step:** Open that practice repository in your browser. Edit `README.md` directly on remote `main`, append `Remote change for pull practice.` and commit through the web interface. The remote now has one commit that your local `main` does not.

```bash
git fetch origin
git log --oneline --graph --decorate --all
cat README.md
git switch main
git pull --ff-only origin main
cat README.md
git status
```

**Expected:** after `fetch`, the local README is unchanged; after `pull --ff-only`, it contains the remote-only line. Stop and inspect if fast-forward is refused.

Publish the branch to be used in exercise 04:

```bash
git switch -c feature/add-note
echo "This repository is connected to a remote." >> README.md
git add README.md
git commit -m "Update README"
git push -u origin feature/add-note
git fetch origin
git branch -r
git remote -v
git status
```

**Expected:** both `origin/main` and `origin/feature/add-note` exist. Leave this remote and branch intact for exercise 04. HTTPS authentication or approved SSH access is needed for real hosted operations.
