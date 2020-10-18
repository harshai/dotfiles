let VIM_CONFIG_PATH="~/.config/vim"
let bindings = VIM_CONFIG_PATH.'/bindings.vim'
let functions = VIM_CONFIG_PATH.'/functions.vim'
let visual = VIM_CONFIG_PATH.'/visual.vim'
let plugins = VIM_CONFIG_PATH.'/plugins.vim'



exec "source " bindings
exec "source " functions
exec "source " visual
exec "source " plugins

