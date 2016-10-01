let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 0

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif