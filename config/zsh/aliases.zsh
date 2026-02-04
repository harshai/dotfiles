# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git checkout'
alias gco='git checkout'
alias gcl='git clone'
alias gcmsg='git commit -m'
alias gm='git commit -S -m'
alias gma='git commit -am'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git reflog'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(green) %an, %ar%Creset"'
alias glo='git log --oneline'
alias glr='git log'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpu='git pull'
alias gpom='git pull origin main'
alias gpr='git pull --rebase'
alias gra='git remote add'
alias grr='git remote rm'
alias grs='git restore'
alias grss='git restore --staged'
alias gs='git status'
alias gst='git status'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gsw='git switch'
alias gswc='git switch -c'

# Pull current branch
alias pull='git pull origin $(git rev-parse --abbrev-ref HEAD)'

# -------------------------------------------------------------------
# Workflow
# -------------------------------------------------------------------
# Python HTTP server (cross-platform, Python 3)
alias serve='python3 -m http.server'
alias hitme='python3 -m http.server'

# Clear terminal (cross-platform)
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  alias clean="printf '\\e]50;ClearScrollback\\a'"
else
  alias clean='clear'
fi

# -------------------------------------------------------------------
# Editors
# -------------------------------------------------------------------
alias vi='nvim'
alias v='nvim'
alias vim8='\vim'  # Escape to original vim if needed

# -------------------------------------------------------------------
# File Listing (using eza, fallback to ls)
# -------------------------------------------------------------------
if command -v eza &> /dev/null; then
  alias ls='eza'
  alias l='eza -lFh --icons'
  alias la='eza -laFh --icons'
  alias ll='eza -l --icons'
  alias lr='eza -lR --icons'
  alias lt='eza -lT --icons --level=2'
  alias lh='eza -la --icons | grep "^\."'
  alias ldot='eza -ld .* --icons'
  alias lS='eza -l --sort=size --icons'
  alias lm='eza -l --sort=modified --icons'
elif command -v exa &> /dev/null; then
  # Fallback to exa if still installed
  alias ls='exa'
  alias l='exa -lFh'
  alias la='exa -laFh'
  alias ll='exa -l'
  alias lr='exa -lR'
  alias lt='exa -lT --level=2'
  alias lh='exa -la | grep "^\."'
  alias ldot='exa -ld .*'
else
  # Fallback to ls with colors
  if $IS_MACOS; then
    alias ls='ls -G'
  else
    alias ls='ls --color=auto'
  fi
  alias l='ls -lFh'
  alias la='ls -laFh'
  alias ll='ls -l'
  alias lr='ls -lR'
  alias lh='ls -la | grep "^\."'
  alias ldot='ls -ld .*'
fi

# -------------------------------------------------------------------
# Directory Navigation
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bk='cd $OLDPWD'
alias md='mkdir -p'
alias rd='rmdir'

# -------------------------------------------------------------------
# System Utils
# -------------------------------------------------------------------
# Top - OS-specific
if $IS_MACOS; then
  alias ttop='top -ocpu -R -F -s 2 -n30'
else
  alias ttop='top -bn1 | head -20'
fi

# Grep with color
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Disk usage
alias df='df -h'
alias du='du -h'
alias dud='du -d 1 -h'
alias duf='du -sh *'

# Process management
alias psg='ps aux | grep -v grep | grep -i'

# -------------------------------------------------------------------
# Quick Config Editing
# -------------------------------------------------------------------
alias zshrc='$EDITOR ~/.zshrc'
alias zshconfig='$EDITOR ~/.config/zsh'
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias gitconfig='$EDITOR ~/.gitconfig'

# -------------------------------------------------------------------
# Misc
# -------------------------------------------------------------------
alias h='history'
alias hg='history | grep'
alias zsh_startup_time='/usr/bin/time zsh -i -c exit'
alias reload='source ~/.zshrc'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias week='date +%V'

# IP addresses
alias myip='curl -s https://ipinfo.io/ip'
alias localip="ipconfig getifaddr en0 2>/dev/null || hostname -I 2>/dev/null | awk '{print \$1}'"

# -------------------------------------------------------------------
# nocorrect - commands that shouldn't be autocorrected
# -------------------------------------------------------------------
alias storybook='nocorrect storybook'
alias npm='nocorrect npm'
alias yarn='nocorrect yarn'
alias pnpm='nocorrect pnpm'
