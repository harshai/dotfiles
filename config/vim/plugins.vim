"" Load plugins
call plug#begin('~/.vim/plugged')

"" NERDTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"" Color
Plug 'sainnhe/forest-night'
" Plug 'franbach/miramare'
" Plug 'lifepillar/vim-gruvbox8'

call plug#end()

for f in split(glob('~/.config/vim/plugin_config/*.vim'), '\n')
    exe 'source' f
endfor
