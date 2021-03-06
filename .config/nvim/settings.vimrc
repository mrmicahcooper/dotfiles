"Settings

set colorcolumn=100
set cursorline
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set hidden
set nohlsearch
set ignorecase
set linebreak
" set list lcs=trail:·,tab:»·
set nobackup
" set noerrorbells visualbell t_vb=
set noswapfile
set noundofile
set nowritebackup
set number
set path+=app
set shell=bash
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set statusline+=%#warningmsg#
set statusline+=%V
set statusline+=\ %f\ %h%w%m%r%*%=%-5.(%l\|%c%)\ offset:%o\ %-5.(%Y\ %)
set ts=2
set tw=80
set undodir=$HOME/.VIM_UNDO_FILES
set visualbell
set wildmenu
set wildmode=list:longest,full
set wrap

syntax on
syntax enable
filetype plugin indent on

let g:rehash256 = 1
retab

autocmd FileType make setlocal noexpandtab
