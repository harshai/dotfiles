function static_load_plugins() {
  antibody bundle < $HOME/.config/zsh/plugins.txt > $HOME/.config/.zsh_plugins.sh
}

# https://davidtw.co/writings/2017/dotfiles#helper-functions | Used to setup
# fasd
_has() {
  which $1>/dev/null 2>&1
}

# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function delete-branches() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --" |
    xargs --no-run-if-empty git branch --delete --force
}
