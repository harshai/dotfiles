function static_load_plugins() {
  antibody bundle < $HOME/.config/zsh/plugins.txt > $HOME/.config/.zsh_plugins.sh
}


# https://davidtw.co/writings/2017/dotfiles#helper-functions | Used to setup
# fasd
_has() {
  which $1>/dev/null 2>&1
}
