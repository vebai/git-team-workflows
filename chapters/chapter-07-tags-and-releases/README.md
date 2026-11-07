# 07 — Tags and releases

**Starting state:** a new, disposable `~/tags-lab` local directory. Verify that it does not already contain work.

```bash
cd ~
mkdir tags-lab
cd tags-lab
git init
git branch -M main
echo "App version 1" > app.txt
git add app.txt
git commit -m "Initial commit"
git tag -a v0.1.0 -m "Initial development version"
git show v0.1.0
```

Create a release and inspect its source commit:

```bash
echo "New feature" >> app.txt
git add app.txt
git commit -m "Add new feature"
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git rev-parse v1.0.0^{}
```

Advance development without moving the existing tag:

```bash
echo "Post-release development" >> app.txt
git add app.txt
git commit -m "Continue development"
git rev-parse main
git rev-parse v1.0.0^{}
```

Create a patch release from the earlier release commit:

```bash
git switch -c maintenance/1.0 v1.0.0
echo "Bug fix" >> app.txt
git add app.txt
git commit -m "Fix critical bug"
git tag -a v1.0.1 -m "Patch version 1.0.1"
git show v1.0.1
git log --oneline --graph --decorate --all
cat app.txt
```

Create and remove a mistaken local tag:

```bash
git tag -a v0.9.0 -m "Mistaken tag"
git tag --list
git tag -d v0.9.0
git tag --list
```

**Optional hosted exercise:** Connect this directory to an *empty practice remote you own*. Replace `REMOTE_URL` with that URL, inspect it and publish only the intended tag:

```bash
git remote add origin REMOTE_URL
git remote -v
git switch main
git push -u origin main
git push origin v1.0.0
git ls-remote --tags origin
```

**Expected:** v1.0.1 is based on v1.0.0, not newer development on main. A tag identifies a source commit; it is not proof of a build or deployment.
