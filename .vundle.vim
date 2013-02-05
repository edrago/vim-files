" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle handle itself
Bundle 'gmarick/vundle'

" Colors
source ~/.vim/.vundle.colors.vim

" Auxiliary vim plugins
"Bundle 'sjl/splice.vim' "Don't play well with fugitive
Bundle 'tpope/vim-surround'

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" HTML/CSS
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'

" Javascript
Bundle 'jakar/vim-json'

" Misc.
Bundle 'tpope/vim-markdown'
