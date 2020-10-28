syntax on
set ruler
set number
set mouse=a
let no_buffers_menu=1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set noshowmode

set mouse=a
set mousemodel=popup
set termguicolors
set guioptions=egmrti
set gfn=Monospace\ 10

" Cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set guifont=Monaco:h10


"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Full height vertical split
set encoding=utf8
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE


set showcmd

