# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# Easy directory navigation
setopt  autocd autopushd pushdignoredups

# Autocorrect
setopt correct # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
# Zsh variable to determine what to ignore,
# in this case everything starting with _ or . 
CORRECT_IGNORE="[_|.]*"

setopt no_beep # dont beep on error

export LC_ALL=en_US.UTF-8 # set locales correctly

export EDITOR="code" # set default editor as VSCODE
export VISUAL="nvim" # Set Visual editor as NeoVim