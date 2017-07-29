" Plugins
call plug#begin()
" Initialize plugin system
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search command line program
Plug 'junegunn/fzf.vim' " fzf vim pulugin
Plug 'tpope/vim-fugitive' " git wapper
call plug#end()
"Colorscheme
colorscheme gruvbox
set background=dark
" Other config
set number
set numberwidth=4 
set ruler 
set colorcolumn=90,120
set showcmd
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set listchars=tab:\|\ 
set list
set backspace=2
set cursorline
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
set autoindent
set laststatus=2

" use tabs, indent two (not four)
set noexpandtab
set tabstop=2
set shiftwidth=2
set smarttab

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).


set clipboard+=unnamedplus

