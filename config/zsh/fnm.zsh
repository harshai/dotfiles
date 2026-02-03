# -------------------------------------------------------------------
# Node Version Management
# - fnm: Used for fast auto-switching (primary)
# - nvm: Available for AFM compatibility (lazy-loaded)
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# fnm - Fast Node Manager (primary, for auto-switching)
# https://github.com/Schniz/fnm
# -------------------------------------------------------------------
if command -v fnm &> /dev/null; then
  # Initialize fnm with auto-switching on directory change
  # Reads: .node-version, .nvmrc, package.json engines.node
  eval "$(fnm env --use-on-cd --shell zsh)"
  
  # fnm aliases
  alias fn='fnm'
  alias fnl='fnm list'
  alias fni='fnm install'
  alias fnu='fnm use'
  alias fnd='fnm default'
fi

# -------------------------------------------------------------------
# nvm - Node Version Manager (lazy-loaded for AFM compatibility)
# https://github.com/nvm-sh/nvm
# -------------------------------------------------------------------
# nvm is lazy-loaded to avoid slow shell startup
# It loads on first use of the `nvm` command

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

# Only set up lazy loading if nvm is installed
if [[ -s "$NVM_DIR/nvm.sh" ]] || { $IS_MACOS && [[ -d "$(brew --prefix 2>/dev/null)/opt/nvm" ]]; }; then
  
  # Lazy loading wrapper for nvm
  nvm() {
    unset -f nvm  # Remove this wrapper
    
    # Load nvm from standard location
    if [[ -s "$NVM_DIR/nvm.sh" ]]; then
      source "$NVM_DIR/nvm.sh"
    elif $IS_MACOS; then
      # Load from Homebrew location
      local brew_prefix="$(brew --prefix 2>/dev/null)"
      if [[ -s "$brew_prefix/opt/nvm/nvm.sh" ]]; then
        source "$brew_prefix/opt/nvm/nvm.sh"
      fi
    fi
    
    # Load bash completion
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    
    # Now run the actual nvm command
    nvm "$@"
  }
fi

# -------------------------------------------------------------------
# Useful Node/npm aliases
# -------------------------------------------------------------------
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nb='npm run build'
alias nci='npm ci'
alias ncu='npx npm-check-updates'

# Yarn aliases
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'
alias ys='yarn start'
alias yt='yarn test'
alias yb='yarn build'

# pnpm aliases  
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm run'
alias pst='pnpm start'
alias pt='pnpm test'
alias pb='pnpm build'
