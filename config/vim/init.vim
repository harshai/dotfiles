let VIM_CONFIG_PATH="~/.config/vim"

let config_files = [
	\'/functions.vim',
	\'/basic.vim',
	\'/visual.vim',
	\'/bindings.vim',
	\'/plugins.vim',
	\'/neovim.vim',
	\'/autocmd.vim',
\]

for file in config_files
	exec "source " VIM_CONFIG_PATH.file
endfor


