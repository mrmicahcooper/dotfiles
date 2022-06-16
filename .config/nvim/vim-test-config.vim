" Vim Testing
function! NvimTest(command) abort
  let jobid = get(g:, 'nvimtest_job_id', 0)
  " let test#neovim#term_position = "vertical topleft"
  if jobid
    call chansend(jobid, ['clear', a:command, ''])
  else
    let term_position = get(g:, 'test#neovim#term_position', 'vertical topleft')
    execute term_position . ' new'
    terminal
    setlocal nonumber
    startinsert
    execute "file! vim-test-window"
    vertical-resize 90
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

"Vim insert shortcuts
iabbrev epry require IEx; IEx.pry
iabbrev epau this.timeout(0); return pauseTest();

