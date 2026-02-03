#!/bin/bash
# -------------------------------------------------------------------
# DevBox/RDE Dotfiles Setup Script
# This script runs automatically when a DevBox starts
# -------------------------------------------------------------------

set -e  # Exit on error

DOTFILES_DIR="$HOME/dotfiles"
echo "🚀 Setting up dotfiles from $DOTFILES_DIR"

# -------------------------------------------------------------------
# Symlink dotfiles
# -------------------------------------------------------------------

# Zsh
ln -sf "$DOTFILES_DIR/config/zsh/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/config/zsh/plugins.txt" ~/.zsh_plugins.txt
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/zsh" ~/.config/zsh

# Git
ln -sf "$DOTFILES_DIR/config/git/gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/config/git/gitignore_global" ~/.gitignore_global

# Neovim
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES_DIR/config/nvim/init.vim" ~/.config/nvim/init.vim
# Symlink entire nvim config directory
ln -sf "$DOTFILES_DIR/config/nvim" ~/.config/nvim

# SSH (copy, don't symlink for security)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp "$DOTFILES_DIR/config/ssh/config" ~/.ssh/config
chmod 600 ~/.ssh/config
mkdir -p ~/.ssh/sockets

# EditorConfig
ln -sf "$DOTFILES_DIR/config/editorconfig" ~/.editorconfig

# -------------------------------------------------------------------
# Create directories
# -------------------------------------------------------------------
mkdir -p ~/Developer
mkdir -p ~/Developer/patches
mkdir -p ~/bin
mkdir -p ~/.vim/undo
mkdir -p ~/.config/nvim/undo
mkdir -p ~/.nvm
mkdir -p ~/.local/share/zsh  # For zsh history

# -------------------------------------------------------------------
# Install fnm (Fast Node Manager) if not present
# -------------------------------------------------------------------
if ! command -v fnm &> /dev/null; then
  echo "📦 Installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  export PATH="$HOME/.local/share/fnm:$PATH"
fi

# -------------------------------------------------------------------
# Install Antidote (zsh plugin manager) if not present
# -------------------------------------------------------------------
if [[ ! -d "$HOME/.antidote" ]]; then
  echo "📦 Installing antidote..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

# -------------------------------------------------------------------
# Install eza (modern ls) if not present and cargo is available
# -------------------------------------------------------------------
if ! command -v eza &> /dev/null; then
  if command -v cargo &> /dev/null; then
    echo "📦 Installing eza..."
    cargo install eza
  else
    echo "⚠️  Cargo not found, skipping eza installation"
  fi
fi

# -------------------------------------------------------------------
# VSCode settings (for web IDE)
# -------------------------------------------------------------------
VSCODE_PATH="$HOME/.config/Code/User"
if [[ -d "$HOME/.config/Code" ]] || [[ -d "$HOME/.vscode-server" ]]; then
  mkdir -p "$VSCODE_PATH"
  ln -sf "$DOTFILES_DIR/config/vscode/settings.json" "$VSCODE_PATH/settings.json"
  ln -sf "$DOTFILES_DIR/config/vscode/keybindings.json" "$VSCODE_PATH/keybindings.json"
  echo "✓ VSCode settings linked"
fi

# -------------------------------------------------------------------
# Local overrides (optional)
# -------------------------------------------------------------------
# Create empty local config files if they don't exist
touch ~/.zshrc.local 2>/dev/null || true
touch ~/.gitconfig_local 2>/dev/null || true

# -------------------------------------------------------------------
# Done!
# -------------------------------------------------------------------
echo "✅ Dotfiles setup complete!"
echo ""
echo "Installed:"
echo "  • Zsh config with aliases and functions"
echo "  • Git config with nvim as editor"
echo "  • Neovim config"
echo "  • EditorConfig"
echo "  • SSH config"
echo "  • fnm for Node version management"
echo ""
echo "Run 'source ~/.zshrc' to reload your shell."
