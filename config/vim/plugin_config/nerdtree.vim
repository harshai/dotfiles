try
  let g:NERDTreeChDirMode=2
  let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', '.happy_pack']
  let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
  let g:NERDTreeShowBookmarks=1
  let g:nerdtree_tabs_focus_on_files=2
  let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
  let g:NERDTreeWinSize = 30
  let NERDTreeShowHidden=1
  let NERDTreeMinimalUI=1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeDirArrowNERDTreeAutoDeleteBuffer = 1
  let NERDTreeDirArrows=1
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
  nnoremap <silent> <leader>g :NERDTreeFind<CR>
  noremap <C-g> :NERDTreeToggle<CR>

  let g:CoolTotalMatches = 1
catch
  echo "nerdtree isn't insalled/enabled"
endtry
