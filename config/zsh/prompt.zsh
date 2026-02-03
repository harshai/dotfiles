# -------------------------------------------------------------------
# Prompt Configuration (Pure prompt)
# https://github.com/sindresorhus/pure
# -------------------------------------------------------------------

# Pure prompt settings
PURE_CMD_MAX_EXEC_TIME=5          # Show execution time after 5s

# Show git stash status
zstyle :prompt:pure:git:stash show yes

# Prompt symbol colors
# zstyle :prompt:pure:prompt:success color green
# zstyle :prompt:pure:prompt:error color red

# Path and git colors
# zstyle :prompt:pure:path color blue
# zstyle :prompt:pure:git:branch color cyan
# zstyle :prompt:pure:git:dirty color magenta
# zstyle :prompt:pure:git:arrow color cyan

# -------------------------------------------------------------------
# Alternative: Starship Prompt
# https://starship.rs/
# -------------------------------------------------------------------
# Uncomment to use Starship instead of Pure
# (Install via: brew install starship OR cargo install starship)
#
# if command -v starship &> /dev/null; then
#   eval "$(starship init zsh)"
# fi

# -------------------------------------------------------------------
# Terminal Title
# -------------------------------------------------------------------
# Set terminal title to current directory
function set_terminal_title() {
  echo -ne "\033]0;${PWD/#$HOME/~}\007"
}

# Update title on each prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_terminal_title

# -------------------------------------------------------------------
# Right Prompt
# -------------------------------------------------------------------
# Optionally show execution time in right prompt
# This is handled by Pure, but can be customized here

# Show current time in right prompt (optional)
# RPROMPT='%F{242}%*%f'
