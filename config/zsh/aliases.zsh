# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias glr='git log'
alias gs='git status'
alias gst='git status'
alias gd='git diff'
alias gm='git commit -S -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gpr='git pull --rebase'
alias gpom='git pull origin master jn ;k h.l'
alias gcl='git clone'
alias gf='git reflog'
alias g='git'
alias gcmsg='git commit -m'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(green) %an, %ar%Creset"'


# -------------------------------------------------------------------
# Workflow
# -------------------------------------------------------------------
alias hitme="python -m SimpleHTTPServer"
alias clean="printf '\e]50;ClearScrollback\a'"

# -------------------------------------------------------------------
# Editors
# -------------------------------------------------------------------
alias vim='nvim'
alias vi='vim'
alias vim8='\vim'


# -------------------------------------------------------------------
# Utils
# -------------------------------------------------------------------
alias bk='cd $OLDPWD'
alias ttop='top -ocpu -R -F -s 2 -n30'
alias lh='exa -a | egrep "^\."'
alias md='mkdir'
alias l='exa -lFh'
alias lr='exa -tRFh'
alias ll='exa -l'
alias ldot='exa -ld .*'
alias zshrc='$EDITOR ~/.zshrc'
alias h='history'
alias zsh_startup_time='/usr/bin/time zsh -i -c exit'



# -------------------------------------------------------------------
# nocorrect
# -------------------------------------------------------------------
alias storybook='nocorrect storybook'