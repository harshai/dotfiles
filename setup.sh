#!/bin/bash
# -------------------------------------------------------------------
# DevBox/RDE Dotfiles Setup Script
# Runs automatically when DevBox starts
# -------------------------------------------------------------------

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

echo "🚀 Setting up custom dotfiles from $DOTFILES_DIR"

# -------------------------------------------------------------------
# Helper function to safely link/copy files
# -------------------------------------------------------------------
safe_link() {
  local src="$1"
  local dest="$2"
  
  if [[ -e "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    rm -rf "$dest"
    ln -sf "$src" "$dest"
    echo "  ✓ Linked $dest"
  fi
}

# -------------------------------------------------------------------
# Zsh Configuration
# -------------------------------------------------------------------
echo "Setting up Zsh..."
safe_link "$DOTFILES_DIR/config/zsh/zshrc" "$HOME/.zshrc"
safe_link "$DOTFILES_DIR/config/zsh/plugins.txt" "$HOME/.zsh_plugins.txt"
mkdir -p "$HOME/.config"
safe_link "$DOTFILES_DIR/config/zsh" "$HOME/.config/zsh"

# Create zsh history directory
mkdir -p "$HOME/.local/share/zsh"

# -------------------------------------------------------------------
# Git Configuration
# -------------------------------------------------------------------
echo "Setting up Git..."
safe_link "$DOTFILES_DIR/config/git/gitconfig" "$HOME/.gitconfig"
safe_link "$DOTFILES_DIR/config/git/gitignore_global" "$HOME/.gitignore_global"

# -------------------------------------------------------------------
# Neovim Configuration
# -------------------------------------------------------------------
echo "Setting up Neovim..."
mkdir -p "$HOME/.config/nvim/undo"
safe_link "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# -------------------------------------------------------------------
# SSH Configuration
# IMPORTANT: Don't overwrite RDE's SSH config - it has injected keys!
# Instead, we use Include to add our config
# -------------------------------------------------------------------
echo "Setting up SSH..."
mkdir -p "$HOME/.ssh/sockets"
chmod 700 "$HOME/.ssh"

# Copy our SSH config as a separate file
if [[ -f "$DOTFILES_DIR/config/ssh/config" ]]; then
  cp "$DOTFILES_DIR/config/ssh/config" "$HOME/.ssh/config.dotfiles"
  chmod 600 "$HOME/.ssh/config.dotfiles"
  
  # Add Include directive to existing config if not already there
  if [[ -f "$HOME/.ssh/config" ]]; then
    if ! grep -q "Include.*config.dotfiles" "$HOME/.ssh/config" 2>/dev/null; then
      # Prepend our include to existing config (after any existing Includes)
      echo "  Adding Include directive to existing SSH config..."
      # Create temp file with our include added after other includes
      sed -i '/^Include/!b;:a;n;/^Include/ba;i\Include config.dotfiles' "$HOME/.ssh/config" 2>/dev/null || \
        echo -e "Include config.dotfiles\n$(cat $HOME/.ssh/config)" > "$HOME/.ssh/config.tmp" && mv "$HOME/.ssh/config.tmp" "$HOME/.ssh/config"
    fi
    echo "  ✓ SSH config.dotfiles installed (included from main config)"
  else
    # No existing config, just use ours
    cp "$DOTFILES_DIR/config/ssh/config" "$HOME/.ssh/config"
    echo "  ✓ Copied SSH config"
  fi
  chmod 600 "$HOME/.ssh/config"
fi

# -------------------------------------------------------------------
# EditorConfig
# -------------------------------------------------------------------
echo "Setting up EditorConfig..."
safe_link "$DOTFILES_DIR/config/editorconfig" "$HOME/.editorconfig"

# -------------------------------------------------------------------
# VSCode Settings (for web IDE)
# -------------------------------------------------------------------
echo "Setting up VSCode..."
VSCODE_PATH="$HOME/.config/Code/User"
mkdir -p "$VSCODE_PATH"
safe_link "$DOTFILES_DIR/config/vscode/settings.json" "$VSCODE_PATH/settings.json"
safe_link "$DOTFILES_DIR/config/vscode/keybindings.json" "$VSCODE_PATH/keybindings.json"

# -------------------------------------------------------------------
# Create useful directories
# -------------------------------------------------------------------
mkdir -p "$HOME/Developer"
mkdir -p "$HOME/bin"
mkdir -p "$HOME/.vim/undo"
mkdir -p "$HOME/.nvm"

# -------------------------------------------------------------------
# Install Antidote (zsh plugin manager) if not present
# -------------------------------------------------------------------
if [[ ! -d "$HOME/.antidote" ]]; then
  echo "📦 Installing antidote (zsh plugin manager)..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

# -------------------------------------------------------------------
# Install fnm (Fast Node Manager) if not present
# -------------------------------------------------------------------
if ! command -v fnm &> /dev/null; then
  echo "📦 Installing fnm (Fast Node Manager)..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi

# -------------------------------------------------------------------
# Local overrides
# -------------------------------------------------------------------
touch "$HOME/.zshrc.local" 2>/dev/null || true
touch "$HOME/.gitconfig_local" 2>/dev/null || true

# -------------------------------------------------------------------
# Done!
# -------------------------------------------------------------------
echo ""
echo "✅ Custom dotfiles setup complete!"
echo ""
echo "Installed:"
echo "  • Zsh config with plugins, aliases, and functions"
echo "  • Git config (nvim editor, rebase on pull)"
echo "  • Neovim config"
echo "  • EditorConfig"
echo "  • SSH config with multiplexing"
echo "  • fnm for Node version management"
echo ""
echo "Run 'exec zsh' to reload your shell."
