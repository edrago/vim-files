"""""""""""""""""""
" Startup Options "
"""""""""""""""""""
set nocompatible
set langmenu=en_US.UTF-8

" Windows Compatibility
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

source ~/.vim/.vundle.vim " Vundle init and config

filetype plugin indent on

if has("gui_running")
    let g:CSApprox_loaded = 0
    set guioptions-=T
    if has("gui_gtk2") || has("gui_gtk3")
        set guifont=DejaVu\ Sans\ Mono\ 9,\ Monospace\ 10
    else
        set guifont=Consolas:h9,\ Andale\ Mono:h9
    endif
else
    if &term =~ '^\(xterm\|screen\)$' || $COLORTERM == 'gnome-terminal'
        set t_Co=256
        let g:solarized_termcolors=256
        let g:CSApprox_eterm = 0
        let g:CSApprox_konsole = 0
        let g:CSApprox_use_showrgb = 1
    endif
    let g:CSApprox_loaded = 0
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
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


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
set shiftwidth=2


"""""""""""""""""
" Style options "
"""""""""""""""""
syntax on
set list
set listchars=tab:▸\

if strftime("%H") < 18
    set background=light
    colorscheme solarized
else
    colorscheme liquidcarbon
endif

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
