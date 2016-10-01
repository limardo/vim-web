if isdirectory(expand("~/.vim/bundle/nerdtree"))
    source $MYVIMSETTINGS/settings/NERDTree/options.vim
endif

if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
    source $MYVIMSETTINGS/settings/CtrlP/options.vim
endif

if isdirectory(expand("~/.vim/bundle/vim-airline/"))
    source $MYVIMSETTINGS/settings/Airline/options.vim
endif

if isdirectory(expand("~/.vim/bundle/vim-gitgutter/"))
    source $MYVIMSETTINGS/settings/Gitgutter/options.vim
endif

if isdirectory(expand("~/.vim/bundle/vim-devicons/"))
    source $MYVIMSETTINGS/settings/NERDFonts/options.vim
endif

if isdirectory(expand("~/.vim/bundle/javascript-libraries-syntax.vim/"))
    let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,angularuirouter,react,flux,requirejs,handlebars'
endif