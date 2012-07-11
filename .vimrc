call pathogen#infect()
call pathogen#helptags()

let mapleader=','
let g:mapleader=','

" Plugin Options
syntax on
filetype plugin indent on

" General settings
set hls
set autoread
set nocompatible
set autoindent
set wildmenu
set wildmode=list:longest
set clipboard=unnamed
set title
set nobackup
set noswapfile

" Style options
set number
set list
set listchars=tab:▸\ ,eol:¬
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
