" Vim plugins
call plug#begin("~/.vim/plugged")

"" status bar
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'jparise/vim-graphql'

" Colors
Plug 'flazz/vim-colorschemes'

" Vim Testing
let test#strategy = "tslime"
Plug 'janko-m/vim-test'

nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"Fuzzy finding
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-s> :Rg<CR>
map <C-h> :Colors<CR>

" Extras
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'jremmen/vim-ripgrep'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'rondale-sc/vim-spacejam'

call plug#end()

set cursorline
set encoding=utf-8
set fileencoding=utf-8
set directory^=$HOME/.vim/tmp//
set expandtab
set guifont=Fira\ Mono:h13
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
set re=1
set shell=bash
set splitbelow
set splitright
set statusline+=%#warningmsg#
set statusline+=%*
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
" colorscheme monokai-phoenix
" colorscheme seoul256
" colorscheme solarized8_light
colorscheme dracula

let g:rehash256 = 1
retab

iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

nnoremap <silent> <Leader>= :exe "resize +4" <CR>
nnoremap <silent> <Leader>- :exe "resize -4" <CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -4" <CR>
nnoremap <silent> <Leader>] :exe "vertical resize +4" <CR>

" Change the max lenth for text and markdown files
autocmd FileType markdown setlocal tw=50 colorcolumn=50
autocmd FileType text setlocal tw=50 colorcolumn=50
autocmd FileType json syntax match Comment +\/\/.\+$+

" Pipe cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
