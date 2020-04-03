"Settings
source $HOME/.config/nvim/settings.vimrc

"Vim plugins
call plug#begin("~/.vim/plugged")

"Status bar
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
map <C-h> :Colors<CR>
" map <C-s> :Rg<CR>

"Full featured LSP client for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source $HOME/.config/nvim/coc.vimrc

"Language support
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'jparise/vim-graphql'

"Extra plugins
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
Plug 'flazz/vim-colorschemes'

"Ctags
"Be sure to install universal ctags
"https://github.com/universal-ctags/ctags
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

"Colors
" colorscheme monokai-phoenix
" colorscheme seoul256
colorscheme solarized8_light
" colorscheme dracula

"Global projections
source $HOME/.config/nvim/projections.vimrc

"Vim shortcuts
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
