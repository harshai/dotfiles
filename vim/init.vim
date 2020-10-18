let VIM_CONFIG_PATH="~/.config/vim"
let functions = VIM_CONFIG_PATH.'/functions.vim'
let bindings = VIM_CONFIG_PATH.'/bindings.vim'

for f in split(glob('~/.config/vim/plugin_config/*.vim'), '\n')
    exe 'source' f
endfor

exec "source " functions
exec "source " bindings
