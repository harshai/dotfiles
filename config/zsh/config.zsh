# -------------------------------------------------------------------
# OS Detection
# -------------------------------------------------------------------
export IS_MACOS=false
export IS_LINUX=false

if [[ "$(uname)" == "Darwin" ]]; then
  export IS_MACOS=true
elif [[ "$(uname)" == "Linux" ]]; then
  export IS_LINUX=true
fi

# -------------------------------------------------------------------
# XDG Base Directory Specification
# -------------------------------------------------------------------
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# -------------------------------------------------------------------
# History
# -------------------------------------------------------------------
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

setopt HIST_SAVE_NO_DUPS       # Do not write a duplicate event to the history file
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries from history
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from history items
setopt HIST_VERIFY             # Show command with history expansion before running it
setopt INC_APPEND_HISTORY      # Save history entries as soon as they are entered
setopt SHARE_HISTORY           # Share history between different instances of the shell
setopt EXTENDED_HISTORY        # Record timestamp of command in HISTFILE

# -------------------------------------------------------------------
# Directory Navigation
# -------------------------------------------------------------------
setopt AUTO_CD                 # cd by typing directory name
setopt AUTO_PUSHD              # Push directories onto stack
setopt PUSHD_IGNORE_DUPS       # Don't push duplicates
setopt PUSHD_SILENT            # Don't print directory stack after pushd/popd
setopt CDABLE_VARS             # cd to named directories

# -------------------------------------------------------------------
# Completion
# -------------------------------------------------------------------
setopt CORRECT                 # Autocorrect commands
setopt AUTO_LIST               # Automatically list choices on ambiguous completion
setopt AUTO_MENU               # Automatically use menu completion
setopt ALWAYS_TO_END           # Move cursor to end if word had one match
setopt COMPLETE_IN_WORD        # Complete from both ends of a word
setopt MENU_COMPLETE           # Auto-select first completion entry

# Ignore patterns for correction
CORRECT_IGNORE="[_|.]*"

# -------------------------------------------------------------------
# Misc Options
# -------------------------------------------------------------------
setopt NO_BEEP                 # Don't beep on error
setopt INTERACTIVE_COMMENTS    # Allow comments in interactive shell
setopt EXTENDED_GLOB           # Extended globbing
setopt NO_FLOW_CONTROL         # Disable Ctrl-S/Ctrl-Q flow control

# -------------------------------------------------------------------
# Locale
# -------------------------------------------------------------------
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# -------------------------------------------------------------------
# Editors
# -------------------------------------------------------------------
export EDITOR="${EDITOR:-code}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

# Less options for better paging
export LESS="-R -F -X -i -M -S"

# -------------------------------------------------------------------
# PATH additions
# -------------------------------------------------------------------
# Add ~/bin to PATH if it exists
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Add ~/.local/bin to PATH if it exists (common on Linux)
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# macOS-specific paths
if $IS_MACOS; then
  # Homebrew paths are set in .zprofile
  :
fi

# -------------------------------------------------------------------
# Colors
# -------------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
