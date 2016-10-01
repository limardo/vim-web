set t_CO=256
scriptencoding utf-8
set encoding=utf-8

syntax on
let mapleader=','

if filereadable(expand("~/.vim/bundle/vim/colors/dracula.vim"))
        colorscheme dracula     " Default colorscheme
endif

set number                      " Side Number
set cursorline                  " Highlight current line
set wildmenu                    " Oneline <tab> menu
set lazyredraw                  " Optimize performace
set noeb vb t_vb=               " Stop Beeping
set splitbelow                  " Add new window below
set splitright                  " Add new window right
set noswapfile                  " No temp file
set showtabline=0               " Hide tabs
set scrolloff=4                 " Center cursor from scroll
set backspace=indent,eol,start  " Fix backspace
set hidden                      " Hide buffer unsaved
set autoindent                  " Autoindent code
set nowrap                      " No wrap line
set linespace=1                 " Set line space
set expandtab                   " Convert tab to space
set guioptions-=l               " Remove left-hand scroll bar
set guioptions-=L               " Remove left-hand scroll bar
set guioptions-=r               " Remove right-hand scroll bar
set guioptions-=R               " Remove right-hand scroll bar
set tabstop=8                   "
set softtabstop=4               "
set shiftwidth=4                "

" set shellslash

" Reload config
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMSETTINGS/.vimrc source $MYVIMRC
    autocmd BufWritePost $MYVIMSETTINGS/.gvimrc source $MYGVIMRC
    autocmd BufWritePost $MYVIMSETTINGS/**/*.vim source $MYVIMRC
augroup END
