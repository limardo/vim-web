let $MYVIMSETTINGS = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

source $MYVIMSETTINGS/settings/plugins.vim

call vundle#end()
filetype plugin indent on

source $MYVIMSETTINGS/settings/general.vim
source $MYVIMSETTINGS/settings/keymap.vim
source $MYVIMSETTINGS/settings/autocomplete.vim
source $MYVIMSETTINGS/settings/search.vim
source $MYVIMSETTINGS/settings/statusbar.vim
source $MYVIMSETTINGS/settings/options.vim
