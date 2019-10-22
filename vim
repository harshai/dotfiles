let VIM_CONFIG_PATH="~/.config/vim"
source &VIM_CONFIG_PATH/init.vim

for f in split(glob('~/.config/vim/plugin_config/*.vim'), '\n')
    exe 'source' f
endfor

source &VIM_CONFIG_PATH/bindings.vim
