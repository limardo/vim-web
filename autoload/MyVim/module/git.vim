function! MyVim#module#git#load() abort
  call MyVim#module#plugin('airblade/vim-gitgutter', {'merged': 0})
  call MyVim#module#plugin('tpope/vim-fugitive', {'merged' : 0})
  call MyVim#module#plugin('tpope/vim-dispatch', {'merged' : 0})
endfunction

function! MyVim#module#git#end() abort
  set updatetime=250      " Refresh time
endfunction
