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
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" Languages
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'cespare/vim-toml'
" Plug 'dsawardekar/ember.vim'
" Plug 'elixir-editors/vim-elixir'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'leshill/vim-json'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'rust-lang/rust'
" Plug 'AndrewRadev/ember_tools.vim'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'slim-template/vim-slim'
" Plug 'vim-ruby/vim-ruby'

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'

"Async Runners
" Vim Testing
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 9
let test#strategy = "asyncrun"

Plug 'janko-m/vim-test'
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Extras
" Plug 'ekalinin/Dockerfile.vim'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
" Plug 'jgdavey/tslime.vim'
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
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'rondale-sc/vim-spacejam'
" Plug 'vim-scripts/bufkill.vim'

" full featured LSP client for vim
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

call plug#end()

" COC extensions
 let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-ember',
  \ 'coc-eslint',
  \ 'coc-elixir',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimlsp'
\ ]

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
colorscheme seoul256
let g:rehash256 = 1
retab

iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

" nnoremap <leader>e :call Send_to_Tmux("clear\nmix test ".expand("%")."\n")<CR>
" nnoremap <leader>E :call Send_to_Tmux("clear\nmix test ".expand("%").":".line(".")."\n")<CR>
" nnoremap <leader>s :call Send_to_Tmux("clear\niex -S mix test ".expand("%")."\n")<CR>
" nnoremap <leader>S :call Send_to_Tmux("clear\niex -S mix test ".expand("%").":".line(".")."\n")<CR>
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


"COC COMMANDS from https://github.com/neoclide/coc.nvim
" set cmdheight=2 " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
