#Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="ys"
# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby history-substring-search history autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# added my path 2011.7.19
# export PATH=/usr/local/bin:/usr/local/apache-maven-2.2.1/bin:/usr/local/maven-1.1/bin:/Developer/android/android-sdk-mac_x86/tools:/usr/local/mysql/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/
# sbin:/usr/local/bin:/usr/X11/bin:/Users/mark/.rvm/bin

# added RVM stuff
# load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# copied from .bash_aliases 2001.07.19
# -------------------------------------------------------------------
# some alias settings, just for fun
# -------------------------------------------------------------------
#alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'today=calendar -A 0 -f ~/calendar/calendar.mark | sort'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'bk=cd $OLDPWD'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias 'lh=exa -a | egrep "^\."'
alias 'md=mkdir'
alias 'l=exa -lFh'
alias 'la=exa -lAFh'
alias 'lr=exa -tRFh'
alias 'lt=exa -ltFh'
alias 'll=exa -l'
alias 'ldot=exa -ld .*'
alias 'lS=exa -1FSsh'
alias 'lart=exa -1Fcart'
alias 'lrt=exa -1Fcrt'
alias 'ls=exa'
alias 'zshrc=$EDITOR ~/.zshrc'
alias 'h=history'
# -------------------------------------------------------------------
# make some commands (potentially) less destructive
# -------------------------------------------------------------------
alias 'rm=rm -i'


# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias git='hub'
alias ga='git add'
alias gitx='open -a GitX .'
alias gp='git push'
alias glr='git log'
alias gs='git status'
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
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias g='git'
alias gcmsg='git commit -m'
alias timesheet="git log --oneline --author='`git config --get user.name`' --pretty=format:'%ad %s' --date=short --since='2 weeks ago'"
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(green) %an, %ar%Creset"'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'

# -------------------------------------------------------------------
# Directories
# -------------------------------------------------------------------
alias dev='~/Development/'

# -------------------------------------------------------------------
# Workflow
# -------------------------------------------------------------------
alias be='bundle exec'
alias bes='bundle exec spinach'
alias ber='bundle exec rspec'
alias serve_this="python -m SimpleHTTPServer"
alias hitme="python -m SimpleHTTPServer"
alias clean="printf '\e]50;ClearScrollback\a'"


# -------------------------------------------------------------------
# Node
# -------------------------------------------------------------------


# -------------------------------------------------------------------
# Editors
# -------------------------------------------------------------------
alias stt='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias vim8='"vim"'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
# necessary to make rake work inside of zsh
alias rake="noglob rake"

# sort files in current directory by the number of words they contain
alias 'wordy=wc -w * | sort | tail -n10'
alias 'filecount=ls -aRF | wc -l'

# -------------------------------------------------------------------
# Functions ported directly from .bashrc
# -------------------------------------------------------------------
# turn hidden files on/off in Finder
function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

# postgres functions
function psqlstart() { /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start ; }
function psqlstop() { /usr/local/pgsql/bin/pg_ctl stop ; }

# view man pages in Preview
function pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }

# apache tomcat functions
function tomcatup() { /usr/local/tomcat/bin/startup.sh ; }
function tomcatdown() { /usr/local/tomcat/bin/shutdown.sh ; }

# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

# myIP address
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

#
## new functions
#
s() { pwd > ~/.save_dir ; }
i() { cd "$(cat ~/.save_dir)" ; }

#
# finis
# mhn 2011.7.19
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$PATH:$(yarn global bin)"
#!/usr/bin/env zsh
# Keeps track of the last used working directory and automatically jumps
# into it for new shells.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Flag indicating if we've previously jumped to last directory.
typeset -g ZSH_LAST_WORKING_DIRECTORY
mkdir -p $ZSH_CACHE_DIR
cache_file="$ZSH_CACHE_DIR/last-working-dir"

# Updates the last directory once directory is changed.
chpwd_functions+=(chpwd_last_working_dir)
function chpwd_last_working_dir() {
  # Use >| in case noclobber is set to avoid "file exists" error
  pwd >| "$cache_file"
}

# Changes directory to the last working directory.
function lwd() {
  [[ ! -r "$cache_file" ]] || cd "`cat "$cache_file"`"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ensure that the gpg-agent is running on opening a shell
#[ -f ~/.gnupg/gpg-agent.env ] && source ~/.gnupg/gpg-agent.env
#if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#  export GPG_AGENT_INFO
#else
#  eval $(gpg-agent --daemon --log-file /tmp/gpg.log --write-env-file ~/.gnupg/gpg-agent.env --pinentry-program /usr/local/bin/pinentry-mac)
#fi
#

# Autocomplete for itermocil
compctl -g '~/.itermocil/*(:t:r)' itermocil

# Run multiple bolt packages
function atlastart() {
  yarn run projector ./projector.js start --packages "$1"
}

# tabtab source for bolt package
# uninstall by removing these lines or running `tabtab uninstall bolt`
[[ -f /Users/isriharsha/.nvm/versions/node/v10.7.0/lib/node_modules/bolt-complete/node_modules/tabtab/.completions/bolt.zsh ]] && . /Users/isriharsha/.nvm/versions/node/v10.7.0/lib/node_modules/bolt-complete/node_modules/tabtab/.completions/bolt.zsh


# Bolt alias
function buildesm() {
  NODE_ENV=production BABEL_ENV=production:esm bolt workspaces exec --parallel --only-fs "$1" -- babel src -d dist/esm --root-mode upward;
}

function buildcjs() {
  NODE_ENV=production BABEL_ENV=production:cjs bolt workspaces exec --parallel --only-fs "$1" -- babel src -d dist/cjs --root-mode upward
}
function buildpkg() {
  bolt workspaces exec --only-fs "$1" -- copy-pkg package.json dist/package.json --only name,version,sideEffects
}

function buildflow() {
  buildesm "$1"
  buildcjs "$1"
  buildpkg "$1"
}

function copydist() {
  cp -rf "../atlaskit-mk-2/packages/core/${1}/dist" "./node_modules/@atlaskit/${1}/"
}

function buildnavonly() {
  buildflow packages/core/navigation-next
}

function buildglobalonly() {
  buildflow packages/core/global-navigation
}
