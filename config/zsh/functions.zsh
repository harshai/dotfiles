function static_load_plugins() {
  antibody bundle < $HOME/.config/zsh/plugins.txt > $HOME/.config/.zsh_plugins.sh
}

# https://davidtw.co/writings/2017/dotfiles#helper-functions | Used to setup
# fasd
_has() {
  which $1>/dev/null 2>&1
}

# https://joshtronic.com/2018/10/05/speed-up-your-shell-prompt-when-usuing-nvm/
# function nvm {
#   if [ -z ${NVM_DIR+x} ]; then
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#     nvm "$@"
#   fi
# }

# Used to autoload nvm use. See https://github.com/nvm-sh/nvm#zsh
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
