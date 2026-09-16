# Dotfiles

Personal configuration files and setup for a development environment optimized for Go, Kubernetes, and container development.

## Contents

- **`zprofile`** — Login shell configuration with Homebrew setup, Volta (JavaScript toolchain), asdf, Rust, and direnv integration
- **`zshenv`** — Environment variables for Zsh
- **`aliases`** — Command aliases for:
  - Claude Code (`cl`)
  - Code editor (`c`)
  - Container tools (nerdctl, docker)
  - Kubernetes (`k`, `kga`, `kgp`, `kgd`, etc.)
  - Navigation shortcuts
  - Common utilities
- **`gitconfig`** — Git configuration with:
  - Useful aliases (`lg` for graph logs, `st` for status, etc.)
  - GPG signing enabled
  - Rebase-on-pull strategy
  - NeoVim as default editor
  - Git LFS support
- **`tmux.conf.local`** — Tmux configuration
- **`config.ghostty`** — Ghostty terminal emulator configuration
- **`fdignore`** — Patterns for `fd` tool to ignore

## Installation

Run the setup script to symlink all configuration files to your home directory:

```bash
./setup.sh
```

The script will:
1. Symlink each configuration file to `~/.{filename}`
2. Skip files that already exist
3. Exclude: `setup.sh`, `config.ghostty`, `.gitignore`, and `README.md`

## Local Overrides

Create `.local` variants of configuration files to add machine-specific settings without modifying tracked files:

- **`.zprofile.local`** — Additional shell configuration
- **`.zshenv.local`** — Additional environment variables
- **`.aliases.local`** — Additional aliases
- **`.gitconfig.local`** — Additional git configuration (loaded via `.gitconfig`)
- **`.gitconfig.private.local`** — Private git settings like user credentials

These files are listed in `.gitignore` and won't be tracked.

## Features

### Kubernetes & Container Development
Comprehensive kubectl aliases for common operations:
- `kga` — get all
- `kgp` — get pods
- `kgd` — get deployments
- `kdn` — get nodes
- `kgpan` — get pods across all namespaces
- Full set of `describe` aliases (`kdp`, `kdd`, `kds`, `kdn`)

### Development Tools
- Cross-platform Homebrew support (macOS and Linux)
- Powerline shell integration (for Linux)
- Golang environment setup
- Rust toolchain (cargo)
- JavaScript toolchain via Volta
- asdf version manager

### Git Workflow
- Visual log output (`lg` shows a colored graph)
- Easy stashing and rebasing
- Rebase-on-pull for cleaner history
- GPG commit signing
- Verbose commit messages by default

## Notes

- macOS users: Uses `gsed` instead of `sed` for GNU sed compatibility
- If `bat` is installed via Homebrew, `cat` and `less` are aliased to it
- Editor is set to NeoVim (`nvim`)
- macOS SDK is pinned to avoid issues with beta/future SDK versions

