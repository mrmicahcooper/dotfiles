highlight Normal ctermbg=none

syntax on
syntax enable

filetype plugin indent on

" Dracula
" colorscheme dracula

"Molokai
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" Solarized colorscheme solarized set background=light
" set background=dark

"Zenburn
colorscheme zenburn

let g:rehash256 = 1
set cursorline
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

retab

iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

nnoremap <leader>e :call Send_to_Tmux("clear\nmix test ".expand("%")."\n")<CR>
nnoremap <leader>E :call Send_to_Tmux("clear\nmix test ".expand("%").":".line(".")."\n")<CR>
nnoremap <leader>s :call Send_to_Tmux("clear\niex -S mix test ".expand("%")."\n")<CR>
nnoremap <leader>S :call Send_to_Tmux("clear\niex -S mix test ".expand("%").":".line(".")."\n")<CR>
nnoremap <silent> <Leader>= :exe "resize +4" <CR>
nnoremap <silent> <Leader>- :exe "resize -4" <CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -4" <CR>
nnoremap <silent> <Leader>] :exe "vertical resize +4" <CR>

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Run mix format on save
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %

" Change the max lenth for text and markdown files
autocmd FileType markdown setlocal tw=50 colorcolumn=50
autocmd FileType text setlocal tw=50 colorcolumn=50

" Pipe cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Vim plugins
call plug#begin("~/.vim/plugged")

Plug 'AndrewRadev/ember_tools.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'cespare/vim-toml'
Plug 'dracula/vim'
Plug 'dsawardekar/ember.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'jelera/vim-javascript-syntax'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'jremmen/vim-ripgrep'
Plug 'kana/vim-textobj-user'
Plug 'leshill/vim-json'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rondale-sc/vim-spacejam'
Plug 'rust-lang/rust'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/bufkill.vim'
Plug 'wgibbs/vim-irblack'

call plug#end()
