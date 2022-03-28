try
  let g:grepper       = {}
  let g:grepper.tools = ['rg', 'ag', 'grep', 'git']

  " Search for the current word
  nnoremap <Leader>* :Grepper -cword -noprompt<CR>”

  "" Search for the current selection
  nmap gs <plug>(GrepperOperator)
  xmap gs <plug>(GrepperOperator)

catch
  echo "vim-grepper isn't installed/enabled"
endtry

