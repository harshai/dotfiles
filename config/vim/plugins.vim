if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Load plugins
call plug#begin('~/.vim/plugged')

"" NERDTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"" Color
Plug 'sainnhe/forest-night'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" Yank
Plug 'machakann/vim-highlightedyank'

"" Search
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

"" Visualise undo list
Plug 'simnalamburt/vim-mundo'


"" neovim only plugins
if has('nvim')

endif

"" vim only plugins
if !has('nvim')
	Plug 'markonm/traces.vim'
endif

call plug#end()

for f in split(glob('~/.config/vim/plugin_config/*.vim'), '\n')
    exe 'source' f
endfor
