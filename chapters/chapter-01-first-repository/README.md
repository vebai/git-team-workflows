# 01 — First repository

**Starting state:** Git installed, commit identity set, no existing `~/git-practice` directory. Run outside the cloned examples repository. Inspect any existing path before proceeding.

```bash
cd ~
mkdir git-practice
cd git-practice
git init
git branch -M main
git status
```

Create a README, ignore rules and an ignored log:

```bash
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
```

Stage and commit only the intended files:

```bash
git add README.md .gitignore
git diff --cached --check
git diff --cached
git commit -m "Initial project setup"
git status
git ls-files
git log --oneline
```

**Expected:** `main` has one commit, only `.gitignore` and `README.md` are tracked, `example.log` is ignored, and the worktree is clean. Keep the directory for exercise 02.
