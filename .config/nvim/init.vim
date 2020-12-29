" Vim plugins
call plug#begin("~/.vim/plugged")
  Plug 'sheerun/vim-polyglot'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'janko-m/vim-test'
  Plug 'jgdavey/vim-blockle'
  Plug 'jremmen/vim-ripgrep'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/BufOnly.vim'
  Plug 'rondale-sc/vim-spacejam'
  Plug 'flazz/vim-colorschemes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let g:python3_host_prog= '/Users/micah.cooper/.asdf/shims/python3'
let $NVIM_TUI_ENABLE_TRUE_COLOR=0

" Vim Testing
function! NvimTest(command) abort
  let jobid = get(g:, 'nvimtest_job_id', 0)
  if jobid
    call chansend(jobid, ['clear', a:command, ''])
  else
    let term_position = get(g:, 'test#neovim#term_position', 'botright')
    execute term_position . ' new'
    terminal
    setlocal nonumber
    startinsert
    execute "file! vim-test-window"
    vertical-resize 80
    let g:nvimtest_job_id = b:terminal_job_id
    call chansend(b:terminal_job_id, [a:command, ''])
    au BufDelete <buffer> let g:nvimtest_job_id = 0
    tmap <buffer> <Esc> <C-\><C-n>
    tmap <buffer> <C-o> <C-\><C-n>
    tmap <buffer> <C-w> <C-\><C-n><C-w>
    let b:neoterm_autoscroll = 1
    stopinsert
    wincmd p
  endif
endfunction

let g:test#custom_strategies = {'nvimtest': function('NvimTest')}
let g:test#strategy = 'nvimtest'

nmap <silent> <Leader>t :w \| TestFile<CR>
nmap <silent> <Leader>T :w \| TestNearest<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>

"Fuzzy finding
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-h> :Colors<CR>
map <C-s> :Rg<CR>

"Colors
set termguicolors
" colorscheme solarized8_light
colorscheme dracula

"Vim insert shortcuts
iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

"Resizing panes
nnoremap <silent> <Leader>= :exe "resize +4" <CR>
nnoremap <silent> <Leader>- :exe "resize -4" <CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -4" <CR>
nnoremap <silent> <Leader>] :exe "vertical resize +4" <CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

"Pipe cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

command! Nfig edit ~/.config/nvim/init.vim
command! DD call delete(expand('%')) | bdelete!
command! Jections edit ~/.config/nvim/projections.vimrc
command! W write
command! Json %!jq '.'

source $HOME/.config/nvim/settings.vimrc
source $HOME/.config/nvim/coc.vimrc
source $HOME/.config/nvim/projections.vimrc
