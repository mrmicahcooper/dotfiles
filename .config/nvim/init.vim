"Vim plugins
call plug#begin("~/.vim/plugged")
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
" Plug 'vim-scripts/bufexplorer.zip'
Plug 'rondale-sc/vim-spacejam'
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"vim-test shortcuts
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>T :TestNearest<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>

" Vim Testing
let test#strategy = "tslime"
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

"Fuzzy finding
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-h> :Colors<CR>
map <C-s> :Rg<CR>

"Colors
set termguicolors
colorscheme monokai-phoenix

"Vim insert shortcuts
iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

"Resizing panes
nnoremap <silent> <Leader>= :exe "resize +4" <CR>
nnoremap <silent> <Leader>- :exe "resize -4" <CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -4" <CR>
nnoremap <silent> <Leader>] :exe "vertical resize +4" <CR>

"Change the max lenth for text and markdown files
autocmd FileType markdown setlocal tw=50 colorcolumn=50
autocmd FileType text setlocal tw=50 colorcolumn=50
autocmd FileType json syntax match Comment +\/\/.\+$+

"Pipe cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

command Nfig edit ~/.config/nvim/init.vim

source $HOME/.config/nvim/settings.vimrc
source $HOME/.config/nvim/coc.vimrc
source $HOME/.config/nvim/projections.vimrc

