# Chapter 7 — Tag releases and verify version identity

**Goal:** Confirm the exact commit intended for a release, create an annotated tag, and inspect it.

From the companion root:

```bash
bash scripts/new-practice-repo.sh ch07-tags
cd practice/ch07-tags
git status
git log -1 --oneline
```

Create a version change and an annotated release tag:

```bash
printf '\nRelease 1.0.0\n' >> README.md
git add README.md
git commit -m "Prepare version 1.0.0"
git log -1 --format='%h %s'
git tag -a v1.0.0 -m "Version 1.0.0"
git show --no-patch v1.0.0
git rev-parse v1.0.0^{}
git rev-parse HEAD
```

The two commit IDs should match: the tag resolves to the commit currently checked out. Modify README and commit again to observe that the existing tag **does not move**.

```bash
printf '\nNext development change\n' >> README.md
git commit -am "Start next development change"
git log --oneline --decorate -4
git show --no-patch v1.0.0
```

**Optional published tag:** after connecting a separate practice remote that you own, confirm `git remote -v`, then push **only** `v1.0.0` with `git push origin v1.0.0`. Verify using `git ls-remote --tags origin`.

A tag identifies source state; it does **not** prove that an image, package or deployment was produced.
