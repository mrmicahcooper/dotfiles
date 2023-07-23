-- vim.g.netrw_liststyle = 3
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.swapfile = false
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = unnamedplus
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

vim.cmd("filetype plugin indent on")
vim.cmd("source ~/.config/nvim/projections.vimrc")
vim.cmd("source ~/.config/nvim/vim-test-config.vim")
