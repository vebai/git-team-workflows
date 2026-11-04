# Set up your Git practice environment

Use a terminal on macOS, Linux, or Git Bash on Windows. Run the commands on **your own machine**, not inside an unrelated production repository.

## 1. Install Git

Check first:

```bash
git --version
```

If Git is missing, install it using one method suitable for your system:

- **macOS:** `xcode-select --install` or `brew install git` if you use Homebrew.
- **Ubuntu/Debian:** `sudo apt update && sudo apt install -y git`.
- **Fedora/RHEL:** `sudo dnf install -y git`.
- **Windows:** install Git for Windows and open **Git Bash**.

Then run `git --version` again. Use a supported recent Git release, particularly for `git switch` and `git restore` commands.

## 2. Configure the identity associated with your practice commits

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
```

Use your intended name/email, not the placeholders. Verify:

```bash
git config --global user.name
git config --global user.email
git config --global init.defaultBranch
```

These settings record commit authorship; they do not log you in to a hosted Git platform.

## 3. Clone this companion repository

```bash
git clone https://github.com/vebai/git-team-workflows.git
cd git-team-workflows
```

If you have the ZIP package instead, extract it and open the `git-team-workflows` directory. Do not run practice Git commands in the companion repository itself.

## 4. Create a disposable practice repository

```bash
bash scripts/new-practice-repo.sh ch01-first-repo
cd practice/ch01-first-repo
git status
git log --oneline -3
```

Return to the companion root with `cd ../..` when a guide asks you to create another practice repository.

## 5. Optional: hosted collaboration

For Chapters 3–4 and 7–10, you may use a **separate, disposable** repository under your own GitHub or GitLab account. Configure HTTPS authentication or SSH according to your provider's current guidance, then test the remote identity and permissions before pushing. Never attempt the lab PRs or branch protection experiments against `vebai/git-team-workflows`.

## Where things run

- `git` commands: your computer, inside the named practice repository.
- `gh` commands (optional): your computer after GitHub CLI authentication.
- Repository setting changes and PR reviews: the hosting platform's web interface.

Do not paste passwords or personal access tokens into files you intend to commit.
