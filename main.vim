if has('vim_starting')
 scriptencoding utf-8
 set encoding=utf-8

 if &compatible
   set nocompatible
 endif
endif

let g:root_folder = fnamemodify(resolve(fnamemodify(expand('<sfile>'), ':p:h:gs?\\?/?')), ':p:gs?[\\/]?/?')
let &rtp = g:root_folder . ',' . $VIMRUNTIME

call MyVim#begin()
call MyVim#end()
