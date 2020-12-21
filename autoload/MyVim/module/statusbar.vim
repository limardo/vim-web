function! MyVim#module#statusbar#load() abort
  call MyVim#module#plugin('vim-airline/vim-airline', {'merged': 0})
endfunction

function! MyVim#module#statusbar#end() abort
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tmuxline#enabled = 1
  let g:Powerline_sybols = 'unicode'
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#fnamecollapse = 1
  let g:airline#extensions#tabline#fnametruncate = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_skip_empty_sections = 1

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

  let g:bufferline_echo = 0
endfunction
