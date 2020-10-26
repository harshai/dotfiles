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

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

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
