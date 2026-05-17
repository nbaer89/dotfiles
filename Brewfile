# ── Brewfile ──────────────────────────────────────────────────────────────────
# Managed by chezmoi. Edit this file and run `chezmoi apply` to update.
# Homebrew will install missing packages and skip already-installed ones.
# To upgrade all: brew bundle --global (or chezmoi apply re-runs this)
#
# NixOS: this file is ignored — Nix manages packages there.
# ─────────────────────────────────────────────────────────────────────────────

# ── Shell & terminal ──────────────────────────────────────────────────────────
brew "zsh"
brew "starship"
brew "zellij"
brew "zoxide"
brew "eza"
brew "bat"
brew "fzf"

# ── VCS ───────────────────────────────────────────────────────────────────────
brew "git"
brew "git-lfs"
brew "lazygit"
brew "gh"
brew "jujutsu"          # jj

# ── Neovim ────────────────────────────────────────────────────────────────────
brew "neovim"
brew "ripgrep"          # telescope dependency
brew "fd"               # telescope dependency
brew "tree-sitter"

# ── Node (versioned — won't auto-upgrade to next major) ───────────────────────
brew "node@22"

# ── Python ────────────────────────────────────────────────────────────────────
brew "uv"               # replaces pip + virtualenv

# ── Rust ──────────────────────────────────────────────────────────────────────
brew "rustup"           # run `rustup toolchain install stable` after install

# ── C/C++ tooling ─────────────────────────────────────────────────────────────
brew "cmake"
brew "ninja"
brew "pkg-config"
brew "llvm"             # includes clangd LSP, clang-format, clang-tidy

# ── Utilities ─────────────────────────────────────────────────────────────────
brew "jq"
brew "yq"
brew "wget"
brew "curl"
brew "tree"
brew "htop"
brew "mosh"
brew "chezmoi"
brew "direnv"

# ── npm globals (installed separately via run_onchange script) ─────────────────
# Listed here for reference — actual install handled by run_onchange_npm-globals
# @earendil-works/pi-coding-agent
# neovim (npm package for neovim node provider)
