nmap <Leader>vi :tabedit $MYVIMRC<cr>           " <, + vi> - Open .vimrc
nmap <Leader>gv :tabedit $MYGVIMRC<cr>          " <, + gv> - Open .gvimrc

if isdirectory(expand("~/.vim/bundle/nerdtree"))
    source $MYVIMSETTINGS/settings/NERDTree/keymap.vim
endif

if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
    source $MYVIMSETTINGS/settings/CtrlP/keymap.vim
endif

if isdirectory(expand("~/.vim/bundle/vim-jsbeautify/"))
    source $MYVIMSETTINGS/settings/Jsbeautify/keymap.vim
endif