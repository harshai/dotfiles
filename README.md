# Dotfiles

My cross-platform dotfiles setup using [dotbot](https://github.com/anishathalye/dotbot).

Works on **macOS** and **Linux** (including Atlassian RDEs).

## What's Included?

- **Zsh** - Customized shell with plugins, aliases, and functions
- **Neovim** - Configured with plugins for development
- **Git** - Global config with useful aliases and diff tools
- **SSH** - Secure config with connection multiplexing
- **EditorConfig** - Consistent coding styles across editors
- **fnm** - Fast Node Manager with auto-switching
- **VSCode** - Settings and keybindings (cross-platform)
- **Homebrew Bundle** - Automated app/tool installation (macOS)
- **Mackup** - Application settings backup (macOS)

## Quick Start

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installer
./install
```

The installer automatically detects your OS and:
- On **macOS**: Sets up Homebrew, installs packages, configures apps
- On **Linux/RDE**: Installs fnm, sets up shell environment

## Features

### Zsh Configuration

Located in `config/zsh/`:

| File | Description |
|------|-------------|
| `zshrc` | Main entry point, loads all configs |
| `config.zsh` | OS detection, history, shell options |
| `aliases.zsh` | Cross-platform aliases (git, files, etc.) |
| `functions.zsh` | Utility functions (fzf integration, etc.) |
| `fnm.zsh` | Node version management with auto-switching |
| `prompt.zsh` | Pure prompt configuration |
| `z_bindings.zsh` | Key bindings |
| `plugins.txt` | Antidote plugin list |

### Node Version Management (fnm)

Uses [fnm](https://github.com/Schniz/fnm) instead of nvm for:
- ⚡ **10x faster** shell startup
- 🔄 **Auto-switching** - Automatically switches Node version based on:
  - `.node-version`
  - `.nvmrc`
  - `package.json` engines field

```bash
# Install a Node version
fnm install 20

# Use a specific version
fnm use 20

# Set default version
fnm default 20

# List installed versions
fnm list
```

### SSH Config

Enhanced SSH configuration with:
- Connection multiplexing (faster repeated connections)
- Keep-alive settings
- macOS Keychain integration
- Organized host configurations

Add local overrides in `~/.ssh/config.local` (not tracked in git).

### EditorConfig

Consistent editor settings across IDEs for:
- JavaScript/TypeScript (2 spaces)
- Python (4 spaces)
- Go (tabs)
- And many more...

### Useful Aliases

```bash
# Git
gs          # git status
gl          # git log (pretty)
gco <branch> # git checkout
gbc         # checkout branch with fzf

# Files (using eza)
l           # list with details
la          # list all (including hidden)
lt          # tree view

# Development
serve       # python http server
nr          # npm/yarn/pnpm run with fzf
killport 3000  # kill process on port

# Navigation
..          # cd ..
...         # cd ../..
mkcd dir    # mkdir && cd
```

### Useful Functions

```bash
delete-branches  # Delete git branches with fzf
gbc              # Checkout branch with fzf
fe               # Find and edit file with fzf
fcd              # Find and cd to directory with fzf
extract file.tar.gz  # Extract any archive
killport 3000    # Kill process on port
weather          # Get weather report
backup file      # Create timestamped backup
```

## Structure

```
dotfiles/
├── install              # Installer script
├── install.conf.yaml    # Dotbot configuration
├── config/
│   ├── brew/
│   │   └── brewfile     # Homebrew packages
│   ├── git/
│   │   ├── gitconfig    # Git configuration
│   │   └── gitignore_global
│   ├── nvim/
│   │   └── init.vim     # Neovim configuration
│   ├── ssh/
│   │   └── config       # SSH configuration
│   ├── vscode/
│   │   ├── settings.json
│   │   └── keybindings.json
│   ├── zsh/
│   │   ├── zshrc
│   │   ├── config.zsh
│   │   ├── aliases.zsh
│   │   ├── functions.zsh
│   │   ├── fnm.zsh
│   │   ├── prompt.zsh
│   │   ├── z_bindings.zsh
│   │   └── plugins.txt
│   ├── editorconfig     # Editor settings
│   └── mackup           # Mackup config (macOS)
└── dotbot/              # Dotbot submodule
```

## Customization

### Local Overrides

These files are loaded if present but not tracked in git:

- `~/.zshrc.local` - Local zsh customizations
- `~/.ssh/config.local` - Local SSH hosts
- `~/.gitconfig_local` - Local git config (work email, etc.)
- `~/.config/nvim/local_init.vim` - Local Neovim config

### Adding Packages (macOS)

Edit `config/brew/brewfile` and run:

```bash
brew bundle --file=config/brew/brewfile
```

## Requirements

- **macOS**: Homebrew (will prompt to install if missing)
- **Linux**: curl, git
- **Both**: Zsh (set as default shell)

## Credits

- [dotbot](https://github.com/anishathalye/dotbot) - Dotfile management
- [antidote](https://github.com/mattmc3/antidote) - Zsh plugin manager
- [pure](https://github.com/sindresorhus/pure) - Minimal prompt
- [fnm](https://github.com/Schniz/fnm) - Fast Node Manager
