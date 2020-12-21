function! MyVim#begin() abort
  " load function file
  " load init file
  call MyVim#defaults#options()
  " call MyVim#defaults#layer()
  " call MyVim#command#load()
endfunction

function! MyVim#end() abort
  " mapping g key
  " mapping z key
  " mapping leader key
  " mapping space key
  " init status bar
  call MyVim#module#load()
  " load general file
  " load command file
  filetype plugin indent on
  syntax on
endfunction
