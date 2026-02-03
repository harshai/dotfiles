# -------------------------------------------------------------------
# Zsh Key Bindings
# -------------------------------------------------------------------

# Use emacs-style key bindings (default for zsh)
bindkey -e

# -------------------------------------------------------------------
# History Search (using zsh-history-substring-search plugin)
# -------------------------------------------------------------------
# Bind up/down arrows to history substring search
# This works with the zsh-history-substring-search plugin
bindkey "^[[A" history-substring-search-up    # Up arrow
bindkey "^[[B" history-substring-search-down  # Down arrow

# Also bind to Ctrl+P/N for history navigation  
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# Fallback: If plugin not loaded, use built-in history search
if ! zle -la | grep -q history-substring-search-up; then
  autoload -U history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey "^[[A" history-beginning-search-backward-end
  bindkey "^[[B" history-beginning-search-forward-end
  bindkey "^P" history-beginning-search-backward-end
  bindkey "^N" history-beginning-search-forward-end
fi

# -------------------------------------------------------------------
# Navigation
# -------------------------------------------------------------------
# Ctrl+Left/Right to move by word
bindkey "^[[1;5C" forward-word   # Ctrl+Right
bindkey "^[[1;5D" backward-word  # Ctrl+Left

# Alt+Left/Right to move by word (alternative)
bindkey "^[f" forward-word       # Alt+f
bindkey "^[b" backward-word      # Alt+b

# Home/End keys
bindkey "^[[H" beginning-of-line  # Home
bindkey "^[[F" end-of-line        # End
bindkey "^A" beginning-of-line    # Ctrl+A
bindkey "^E" end-of-line          # Ctrl+E

# -------------------------------------------------------------------
# Editing
# -------------------------------------------------------------------
# Delete word backwards
bindkey "^W" backward-kill-word
bindkey "^[^?" backward-kill-word  # Alt+Backspace

# Delete word forwards
bindkey "^[d" kill-word            # Alt+d

# Delete to beginning/end of line
bindkey "^U" backward-kill-line
bindkey "^K" kill-line

# -------------------------------------------------------------------
# Misc
# -------------------------------------------------------------------
# Clear screen
bindkey "^L" clear-screen

# Undo/Redo
bindkey "^_" undo
bindkey "^[_" redo

# Accept autosuggestion (for zsh-autosuggestions plugin)
bindkey "^F" forward-char          # Accept one char
bindkey "^[f" forward-word         # Accept one word
bindkey "^[[Z" autosuggest-accept  # Shift+Tab to accept

# Edit command line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line   # Ctrl+X Ctrl+E

# -------------------------------------------------------------------
# Menu Navigation
# -------------------------------------------------------------------
# Use Tab/Shift+Tab to navigate completion menu
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete  # Shift+Tab

# Use hjkl to navigate completion menu (vim-style)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# -------------------------------------------------------------------
# Special Keys (cross-platform fixes)
# -------------------------------------------------------------------
# Make sure Delete key works
bindkey "^[[3~" delete-char

# Make sure Backspace works
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char

# Insert key
bindkey "^[[2~" overwrite-mode
