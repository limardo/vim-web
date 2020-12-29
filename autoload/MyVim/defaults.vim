scriptencoding utf-8

function! MyVim#defaults#options() abort
  if has('gui_running')
    set guioptions-=m " Hide menu bar.
    set guioptions-=T " Hide toolbar
    set guioptions-=L " Hide left-hand scrollbar
    set guioptions-=r " Hide right-hand scrollbar
    set guioptions-=b " Hide bottom scrollbar
    set showtabline=0 " Hide tabline
    set guioptions-=e " Hide tab
  endif

  " let mapleader = ','

  set number                      " Side Number
  set cursorline                  " Highlight current line
  set wildmenu                    " Oneline <tab> menu
  set lazyredraw                  " Optimize performace
  set noeb vb t_vb=               " Stop Beeping
  set splitbelow                  " Add new window below
  set splitright                  " Add new window right
  set showtabline=0               " Hide tabs
  set scrolloff=1                 " Center cursor from scroll
  set sidescrolloff=5             "
  set backspace=indent,eol,start  " Fix backspace
  set hidden                      " Hide buffer unsaved
  set autoindent                  " Autoindent code
  set smartindent                 " Smartindent code
  set cindent                     "
  set nowrap                      " No wrap line
  set linespace=2                 " Set line space
  set linebreak                   "
  set autoread                    " Automatically read a file changed outside of vim
  set expandtab                   " Convert tab to space
  set tabstop=8                   "
  set softtabstop=4               "
  set shiftwidth=4                "
  set expandtab                   " Convert tab to space

  set nrformats-=octal
  set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
  set fillchars=vert:│,fold:·

  set laststatus=2

  set noshowcmd

  set backup
  set undofile
  set undolevels=1000

  set maxmempattern=100000

  let g:data_dir = g:root_folder . '/.data/'
  let g:backup_dir = g:data_dir . 'backup'
  let g:swap_dir = g:data_dir . 'swap'
  let g:undo_dir = g:data_dir . 'undofile'
  let g:conf_dir = g:data_dir . 'conf'

  if finddir(g:data_dir) ==# ''
    silent call mkdir(g:data_dir, 'p', 0700)
  endif

  if finddir(g:backup_dir) ==# ''
    silent call mkdir(g:backup_dir, 'p', 0700)
  endif

  if finddir(g:swap_dir) ==# ''
    silent call mkdir(g:swap_dir, 'p', 0700)
  endif

  if finddir(g:undo_dir) ==# ''
    silent call mkdir(g:undo_dir, 'p', 0700)
  endif

  if finddir(g:conf_dir) ==# ''
    silent call mkdir(g:conf_dir, 'p', 0700)
  endif

  let &undodir = g:undo_dir
  let &backupdir = g:backup_dir
  let &directory = g:swap_dir

  unlet g:data_dir
  unlet g:backup_dir
  unlet g:swap_dir
  unlet g:undo_dir
  unlet g:conf_dir

  set nowritebackup
  set matchtime=0
  set ruler
  set showmatch
  set showmode
  set completeopt=menu,menuone,longest
  set complete=.,w,b,u,t
  set pumheight=15
  set display+=lastline
  set wildignorecase
  set mouse=nv
  set ttimeout
  set ttimeoutlen=50

  set shortmess+=s

  set foldtext=MyVim#defaults#Customfoldtext()

  call MyVim#defaults#search()
  call MyVim#defaults#mapping()
endfunction

function! MyVim#defaults#Customfoldtext() abort
  let fs = v:foldstart
  while getline(fs) =~# '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let foldsymbol='+'
  let repeatsymbol='-'
  let prefix = foldsymbol . ' '

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat(repeatsymbol, w - strwidth(prefix.foldSizeStr.line.foldLevelStr.foldPercentage))
  return prefix . line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

function! MyVim#defaults#search() abort
  set hlsearch        " Highlight all item
  set incsearch       " Highlight first item during the searching
  set wildignorecase  " Ignore case
  set smartcase       " Use smartcase
endfunction

function! MyVim#defaults#mapping() abort
  " use Cmd+* to split editor"
  " nnoremap <silent><D-S>e :vsplit<CR>
  " nnoremap <silent><D-S>d :split<CR>

  " Use Cmd+* to jump between windows
  " nnoremap <silent><D-Right> :<C-u>wincmd l<CR>
  " nnoremap <silent><D-Left>  :<C-u>wincmd h<CR>
  " nnoremap <silent><D-Up>    :<C-u>wincmd k<CR>
  " nnoremap <silent><D-Down>  :<C-u>wincmd j<CR>

  "Cmd+Shift+Up/Down to move up and down
  nnoremap <silent><D-S-Down> :m .+1<CR>==
  nnoremap <silent><D-S-Up> :m .-2<CR>==
  inoremap <silent><D-S-Down> <Esc>:m .+1<CR>==gi
  inoremap <silent><D-S-Up> <Esc>:m .-2<CR>==gi
  vnoremap <silent><D-S-Down> :m '>+1<CR>gv=gv
  vnoremap <silent><D-S-Up> :m '<-2<CR>gv=gv

  " Start new line
  nnoremap <S-CR> o
  nnoremap <D-M-CR> <S-o>
  inoremap <S-CR> <C-o>o
  inoremap <D-M-CR> <C-o><S-o>

  " Save all
  nnoremap <D-s> <ESC>:wa<CR>

  " Close file
  nmap <D-w> <ESC>:bd<CR>
endfunction
