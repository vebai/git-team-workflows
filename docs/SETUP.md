# Setup

Check Git:

```bash
git --version
```

Install it if needed: macOS uses `xcode-select --install` or `brew install git`; Ubuntu/Debian uses `sudo apt update && sudo apt install -y git`; Fedora uses `sudo dnf install -y git`. On Windows use Git for Windows and Git Bash.

Configure commit identity with your own values, then inspect:

```bash
git config --global user.name "YOUR NAME"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global user.name
git config --global user.email
```

Keep practice repositories **outside** this repository, unless you deliberately use `scripts/new-practice-repo.sh`, which puts independent projects under its ignored `practice/` directory. A clone of this repository is a source of examples, not the destination for exercise commits.

For hosted examples you need a GitHub/GitLab account, a separate practice remote you own or may use, and HTTPS credential-manager or approved SSH authentication. Verify `git remote -v` before any push. Do not paste passwords or tokens into tracked files.
