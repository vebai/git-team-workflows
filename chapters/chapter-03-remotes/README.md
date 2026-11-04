# Chapter 3 — Connect local work to remote repositories

**Goal:** Distinguish `fetch`, `pull` and `push`, and understand `origin` and remote-tracking branches.

The first path uses a **local bare repository** as a safe stand-in for a hosted remote. It needs no GitHub credentials.

From the companion repository root:

```bash
bash scripts/new-practice-repo.sh ch03-remotes
mkdir -p practice/remotes
git init --bare practice/remotes/ch03-shared.git
git -C practice/ch03-remotes remote add origin "$(pwd)/practice/remotes/ch03-shared.git"
git -C practice/ch03-remotes push -u origin main
git clone practice/remotes/ch03-shared.git practice/ch03-teammate
```

Simulate another contributor updating the shared repository:

```bash
printf '\n- A teammate added this note.\n' >> practice/ch03-teammate/docs/notes.md
git -C practice/ch03-teammate add docs/notes.md
git -C practice/ch03-teammate commit -m "Add teammate note"
git -C practice/ch03-teammate push origin main
```

On your first local repository, **fetch before integrating**:

```bash
git -C practice/ch03-remotes fetch origin
git -C practice/ch03-remotes log --oneline main..origin/main
git -C practice/ch03-remotes diff main..origin/main
git -C practice/ch03-remotes pull --ff-only origin main
git -C practice/ch03-remotes status
```

Expected: after fetching, `origin/main` is ahead. After the fast-forward pull, both local `main` and the remote-tracking branch identify the same commit.

## Optional real GitHub/GitLab remote

Create a separate **disposable repository in your own account**, configure HTTPS or SSH authentication, and repeat the remote workflow there. Do not push exercise branches or tags to the published companion repository.

**Verify:** inspect `git remote -v`, `git branch -avv`, and `git log --oneline --graph --all`. Confirm you know which repository will receive a push.
