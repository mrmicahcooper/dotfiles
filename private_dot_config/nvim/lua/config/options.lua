-- vim.g.netrw_liststyle = 3
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.o.ignorecase = true
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.o.autoindent = true
vim.o.backup = false
vim.o.cmdheight = 0
vim.o.colorcolumn = "100"
vim.o.conceallevel = 0
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fileencoding = "utf-8"
vim.o.hidden = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 5
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.textwidth = 100
vim.o.timeoutlen = 100
vim.o.timeoutlen = 1000
vim.o.updatetime = 300
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.writebackup = false
vim.opt.clipboard = 'unnamed'
vim.opt.termguicolors = true
vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.wo.wrap = true

vim.cmd("filetype plugin indent on")
vim.cmd("source ~/.config/nvim/projections.vimrc")
vim.cmd("source ~/.config/nvim/vim-test-config.vim")

vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
