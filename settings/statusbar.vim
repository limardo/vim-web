set laststatus=2    " Display statusbar always
set ruler           " Line column statusbar information

if isdirectory(expand("~/.vim/bundle/vim-airline/"))
    source $MYVIMSETTINGS/settings/Airline/options.vim
endif
