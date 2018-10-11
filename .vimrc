if $VIM_PLUGINS != 'NO'
  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    execute pathogen#infect('~/.vimbundles/{}', '~/.vim/bundle/{}')
  endif
  runtime! ftplugin/man.vim
endif

highlight Normal ctermbg=none

syntax on
syntax enable

filetype plugin indent on

colorscheme solarized

" set background=light
set background=dark
set colorcolumn=80
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
set tw=79
set undodir=$HOME/.VIM_UNDO_FILES
set visualbell
set wildmenu
set wildmode=list:longest,full
set wrap linebreak nolist

retab

iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();
iabbrev epry require IEx; IEx.pry

let g:two_firewatch_italics=1
let g:airline_theme='twofirewatch'

nnoremap <leader>e :call Send_to_Tmux("mix test ".expand("%")."\n")<CR>
nnoremap <leader>E :call Send_to_Tmux("mix test ".expand("%").":".line(".")."\n")<CR>
nnoremap <leader>s :call Send_to_Tmux("iex -S mix test ".expand("%")."\n")<CR>
nnoremap <leader>S :call Send_to_Tmux("iex -S mix test ".expand("%").":".line(".")."\n")<CR>
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
