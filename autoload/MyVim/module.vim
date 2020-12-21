let s:enabled_modules = []

fu! s:call(func, ...) abort
  try
    return call(function(a:func), a:000)
  catch /^Vim\%((\a\+)\)\=:E117/
    return 0
  endtry
endf

function! s:find_module() abort
  let modules = split(globpath(&rtp, 'autoload/MyVim/module/**/*.vim'), '\n')
  let pattern =  '/autoload/MyVim/module/'
  let rst = []

  for module in modules
    if module =~# pattern
      let name = substitute(module[matchend(module, pattern):-5], '/', '#','g')

      call add(rst, name)
    endif
  endfor

  return rst
endfunction

function! s:load_enabled_modules() abort
  let modules = s:find_module()

  for module in modules
    if index(s:enabled_modules, module) == -1
      call add(s:enabled_modules, module)
    endif
  endfor
endfunction

call s:load_enabled_modules()

function s:load_modules() abort
  for module in MyVim#module#get()
    call MyVim#module#add(module)
  endfor
endfunction

function! s:install_manager() abort
  let &rtp .= ',' . g:root_folder . 'bundles/dein.vim'
endf

call s:install_manager()

function! MyVim#module#load() abort
  call MyVim#module#begin(g:root_folder . 'bundles/dein.vim')
  call MyVim#module#fetch()
  call s:load_modules()
  call MyVim#module#end()
endfunction

function! MyVim#module#get() abort
  return deepcopy(s:enabled_modules)
endfunction

function! MyVim#module#isLoaded(module) abort
  return index(s:enabled_modules, a:module) != -1
endfunction

function! MyVim#module#begin(path) abort
  call dein#begin(a:path)
endfunction

function! MyVim#module#fetch() abort
  call dein#add(g:root_folder . 'bundles/dein.vim', { 'merged' : 0})

  for module in MyVim#module#get()
    call MyVim#module#hook(module, 'load')
  endfor
endfunction

function! MyVim#module#hook(module, hook) abort
  let loadable = 1

  if s:call('MyVim#module#'.a:module.'#loadable')
    let loadable = s:call('MyVim#module#'.a:module.'#loadable')
  endif

  if loadable
    call s:call('MyVim#module#'.a:module.'#'.a:hook)
  endif
endfunction

function! MyVim#module#add(module) abort
  call MyVim#module#hook(a:module, 'init')
endfunction

function! MyVim#module#plugin(repo, args) abort
  call dein#add(a:repo, a:args)
endfunction

function! MyVim#module#end() abort
  call dein#end()
  let &rtp .= ',' . g:root_folder . 'after'

  silent! let g:_plugins_checking_flag = dein#check_install()

  call dein#call_hook('source')

  for module in MyVim#module#get()
    call MyVim#module#hook(module, 'end')
  endfor
endfunction
