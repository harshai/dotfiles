"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"" Color
Plug 'morhetz/gruvbox'

call plug#end()

for f in split(glob('~/.config/vim/plugin_config/*.vim'), '\n')
    exe 'source' f
endfor
