function! MyVim#module#filetree#load() abort
  call MyVim#module#plugin('preservim/nerdtree' , {'merged': 0})
  call MyVim#module#plugin('Xuyuanp/nerdtree-git-plugin', {'merged' : 0})
endfunction

function! MyVim#module#filetree#init() abort
  let mapleader = ','

  let g:NERDTreeWinPos = 'left'
  let g:NERDTreeWinSize=get(g:,'NERDTreeWinSize',31)
  let g:NERDTreeChDirMode=get(g:,'NERDTreeChDirMode',1)
  let g:NERDTreeShowHidden = 1

  autocmd!
  autocmd VimEnter * NERDTree | wincmd p
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  nmap <C-\> :call MyVim#module#filetree#toggle()<CR> " nmap <Leader>1 :NERDTreeToggle<cr>

  let g:NERDTreeStatusline = ''
endfunction

function! MyVim#module#filetree#toggle() abort
  let curretBuf = @%
  let isOpen = g:NERDTree.GetWinNum() !=# -1
  let isCurrent = curretBuf == t:NERDTreeBufName

  if isOpen && !isCurrent
    execute 'NERDTreeFocus'
  else
    execute 'NERDTreeToggle'
  endif
endfunction
