"""""""""""""""""""
" Startup Options "
"""""""""""""""""""
set nocompatible

filetype off
let g:pathogen_disabled = ['paredit','vim-clojure-sql']
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on


"if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
if has("gui_running")
  let g:CSApprox_loaded = 0
else
  set t_Co=256
  let g:solarized_termcolors=256
  let g:CSApprox_eterm = 0
  let g:CSApprox_konsole = 0
  let g:CSApprox_use_showrgb = 1
endif


"""""""""""""""
" Key Mapings "
"""""""""""""""
let mapleader=","
let maplocalleader=","
nmap <silent> <leader>wm :call MarkWindowSwap()<CR>
nmap <silent> <leader>wp :call DoWindowSwap()<CR>
nnoremap j gj
nnoremap k gk
nnoremap ; :
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>


""""""""""""""""""""
" General settings "
""""""""""""""""""""
"" Vim behavior
set autoread
set nobackup
set noswapfile

"" Vim Interface
set laststatus=2
set statusline=%f\ %h%m\ [%{strlen(&fenc)?&fenc:'none'}/%{&ff}/%Y]\ %=%h\%c,%l/%L\ \ \ %P
set title
set relativenumber
set wildmenu

"" File
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf8

"" Formating
set autoindent
set clipboard=unnamed
"Use spaces instead of tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4


"""""""""""""""""
" Style options "
"""""""""""""""""
syntax on
set list
set listchars=tab:▸\

"set background=light
colorscheme molokai-losh

"""""""""""
" SCRIPTS "
"""""""""""
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
    echo "<-- Buffer Marked -->"
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction
