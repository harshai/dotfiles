# Add plugins if zsh_plugin file doesn't exist or is an empty file
if [ ! -s $HOME/.config/.zsh_plugins.sh ]; then
  static_load_plugins
fi
# See https://github.com/getantibody/antibody/issues/249#issuecomment-417883987
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source $HOME/.config/.zsh_plugins.sh


# Load zsh files
for i in $HOME/.config/zsh/*.zsh; do;
    test -r "$i" && source "$i"
done


# Enable autocomplete
autoload -Uz compinit
# Cache autocomplete data, update once a day.
# see https://carlosbecker.com/posts/speeding-up-zsh/ and https://gist.github.com/ctechols/ca1035271ad134841284
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enable fasd
if _has fasd; then
  eval "$(fasd --init auto)"
fi


# Lazy load nvm. https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/d5ib9fs
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done
