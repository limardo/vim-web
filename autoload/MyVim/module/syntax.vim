function! MyVim#module#syntax#load() abort
  call MyVim#module#plugin('vim-syntastic/syntastic', {'merged': 0})
  call MyVim#module#plugin('sheerun/vim-polyglot', {'merged': 0})
endfunction

function! MyVim#module#syntax#end() abort
  let s:show_cursor_error = 1

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_error_symbol = '✖'
  let g:syntastic_warning_symbol = ''

  let g:style_error_symbol = 'XXX'
  let g:style_warning_symbol = 'XXX'

  " let g:syntastic_vimlint_options = {'EVL102': 1 , 'EVL103': 1 , 'EVL205': 1 , 'EVL105': 1}

  let g:syntastic_javascript_checkers = ['prettier', 'eslint']
  let g:syntastic_typescript_checkers = ['prettier', 'eslint', 'tslint']
endfunction
