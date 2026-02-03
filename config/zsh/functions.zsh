# -------------------------------------------------------------------
# Git Functions
# -------------------------------------------------------------------

# Delete branches interactively using fzf
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function delete-branches() {
  local branches
  branches=$(git branch | grep --invert-match '\*' | cut -c 3- | fzf --multi --preview="git log {} --")
  
  if [[ -n "$branches" ]]; then
    echo "$branches" | while read -r branch; do
      git branch --delete --force "$branch"
    done
  fi
}

# Checkout branch interactively using fzf
function gbc() {
  local branch
  branch=$(git branch --all | grep -v HEAD | sed 's/.* //' | sed 's#remotes/origin/##' | sort -u | fzf --preview="git log --oneline --graph {}")
  
  if [[ -n "$branch" ]]; then
    git checkout "$branch"
  fi
}

# Show git log with fzf and preview
function glog() {
  git log --oneline --graph --color=always | fzf --ansi --preview="git show --color=always {1}"
}

# -------------------------------------------------------------------
# Directory Functions
# -------------------------------------------------------------------

# Create directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Find directory and cd into it using fzf
function fcd() {
  local dir
  dir=$(find ${1:-.} -type d 2>/dev/null | fzf +m --preview="ls -la {}")
  if [[ -n "$dir" ]]; then
    cd "$dir"
  fi
}

# -------------------------------------------------------------------
# File Functions
# -------------------------------------------------------------------

# Find file and open in editor using fzf
function fe() {
  local file
  file=$(fzf --preview="cat {}")
  if [[ -n "$file" ]]; then
    ${EDITOR:-vim} "$file"
  fi
}

# Extract various archive formats
function extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.tar.xz)    tar xJf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# -------------------------------------------------------------------
# Process Functions
# -------------------------------------------------------------------

# Kill process by port
function killport() {
  if [[ -z "$1" ]]; then
    echo "Usage: killport <port>"
    return 1
  fi
  
  local pid
  if $IS_MACOS; then
    pid=$(lsof -ti:$1)
  else
    pid=$(fuser $1/tcp 2>/dev/null)
  fi
  
  if [[ -n "$pid" ]]; then
    echo "Killing process $pid on port $1"
    kill -9 $pid
  else
    echo "No process found on port $1"
  fi
}

# Find process by name
function psfind() {
  ps aux | grep -v grep | grep -i "$1"
}

# -------------------------------------------------------------------
# Network Functions
# -------------------------------------------------------------------

# Get weather
function weather() {
  curl "wttr.in/${1:-}"
}

# Quick HTTP headers check
function headers() {
  curl -I "$1"
}

# -------------------------------------------------------------------
# Development Functions
# -------------------------------------------------------------------

# Quick npm/yarn/pnpm run with fzf
function nr() {
  local script
  if [[ -f "package.json" ]]; then
    script=$(jq -r '.scripts | keys[]' package.json | fzf)
    if [[ -n "$script" ]]; then
      if [[ -f "pnpm-lock.yaml" ]]; then
        pnpm run "$script"
      elif [[ -f "yarn.lock" ]]; then
        yarn run "$script"
      else
        npm run "$script"
      fi
    fi
  else
    echo "No package.json found"
  fi
}

# -------------------------------------------------------------------
# Utility Functions  
# -------------------------------------------------------------------

# Calculator
function calc() {
  echo "$*" | bc -l
}

# Quick notes
function note() {
  local notes_dir="${HOME}/notes"
  mkdir -p "$notes_dir"
  
  if [[ -z "$1" ]]; then
    ${EDITOR:-vim} "$notes_dir"
  else
    ${EDITOR:-vim} "$notes_dir/$1.md"
  fi
}

# Backup a file with timestamp
function backup() {
  cp "$1" "${1}.backup.$(date +%Y%m%d_%H%M%S)"
}

# Print a separator line
function hr() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "${1:--}"
}
