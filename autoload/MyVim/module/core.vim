function! MyVim#module#core#load() abort
  set encoding=UTF-8

  call MyVim#module#plugin('ryanoasis/vim-devicons', {'merged': 0})
  call MyVim#module#plugin('dracula/vim', {'merged': 0, 'name': 'dracula'})
  call MyVim#module#plugin('editorconfig/editorconfig-vim', {'merged': 0})

  " let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  " let g:DevIconsEnableFolderPatternMatching = 1
  " let g:DevIconsEnableFolderExtensionPatternMatching = 0

  if exists("g:loaded_webdevicons")
      call webdevicons#refresh()
  endif
endfunction

function! MyVim#module#core#end() abort
  colorscheme dracula
endfunction
