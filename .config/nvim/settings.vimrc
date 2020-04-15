"Settings
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set directory^=$HOME/.vim/tmp//
set expandtab
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set hidden
set nobackup
set noerrorbells visualbell t_vb=
set nolist
set noswapfile
set noundofile
set nowritebackup
set nu
set path+=app
" set re=1 "Using this makes the typescript highlighting reaaaallly slow
set shell=bash
set splitbelow
set splitright
set statusline+=%#warningmsg#
set statusline+=%V
set statusline=\ %f\ %h%w%m%r%*%=%-5.(%l\|%c%)\ %-5.(%Y\ %)
set ts=2 shiftwidth=2 expandtab
set colorcolumn=80
set tw=80
set undodir=$HOME/.VIM_UNDO_FILES
set visualbell
set wildmenu
set wildmode=list:longest,full
set wrap linebreak nolist
set nohlsearch

syntax on
syntax enable
filetype plugin indent on

let g:rehash256 = 1
retab
