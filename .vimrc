" Startup Options "
set nocompatible
call pathogen#infect()
call pathogen#helptags()

let mapleader=","
let maplocalleader=","

map <F2> :NERDTreeToggle<CR>
map <F3> :call TabCompletion()<CR>
nmap <silent> <leader>wm :call MarkWindowSwap()<CR>
nmap <silent> <leader>wp :call DoWindowSwap()<CR>


""""""""""""""""""
" Plugin Options "
""""""""""""""""""
syntax on
filetype plugin indent on

let vimclojure#FuzzyIndent = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"


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
set wildmenu

"" File
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf8

"" Formating
set autoindent
set smartindent
set clipboard=unnamed
"Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=4


"""""""""""""""""
" Style options "
"""""""""""""""""
set number
set list
set listchars=tab:▸\ ,eol:¬
"set t_Co=16
"colorscheme solarized
"if has('gui_running')
"  set background=light
"else
"  set background=light
"endif
  
"let g:solarized_termcolors=16


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

" toggle tab completion
function! TabCompletion()
  if mapcheck("\<tab>", "i") != ""
    :iunmap <tab>
    :iunmap <s-tab>
    echo "--tab completion OFF--"
  else
    :imap <tab> <c-n>
    :imap <s-tab> <c-p>
    echo "--tab completion ON--"
  endif
endfunction

