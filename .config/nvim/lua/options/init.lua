vim.cmd('filetype plugin indent on')
vim.cmd 'colorscheme material'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true vim.opt.termguicolors = true vim.o.conceallevel = 0 vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
-- vim.o.clipboard =  'pbcopy'
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff =  5
vim.o.mouse = "a"
vim.wo.wrap = true
vim.wo.number = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.o.timeoutlen = 1000
vim.bo.expandtab = true

vim.api.nvim_set_keymap('n', '<c-P>',
  "<cmd>lua require('fzf-lua').files()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<c-B>',
  "<cmd>lua require('fzf-lua').buffers()<CR>",
  { noremap = true, silent = true })

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>=', ':exe "resize +4" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>-', ':exe "resize -4" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', ':exe "vertical resize -30" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>]', ':exe "vertical resize +30" <CR>', { noremap = true, silent = true })
