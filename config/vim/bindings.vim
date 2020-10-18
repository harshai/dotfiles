"" Map leader to ,
let mapleader="\<SPACE>"

"""""""""""""""""
"" NORMAL MODE
"""""""""""""""""
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Close buffer
noremap <leader>c :b#<bar>bd#<CR>

"" Clean search (highlight)
nnoremap <silent> <leader>; :noh<cr>

"" Quick write
noremap <leader>s :w!<cr>

"" Toggle between relative and custom numbers
nnoremap <C-n> :call  ToggleNumber()<CR>


"""""""""""""""""
"" TERMINAL MODE
"""""""""""""""""

"" Exit from terminal mode
tnoremap jk <C-\><C-n>
tnoremap jj <C-\><C-n>





"""""""""""""""""
"" INSERT MODE
"""""""""""""""""

"" Map escape
imap jj <Esc>
imap jk <Esc>




"""""""""""""""""
"" VISUAL MODE
"""""""""""""""""
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

echo "Bindings initialised"
