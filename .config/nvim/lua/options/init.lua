vim.cmd('filetype plugin indent on')

-- colorscheme
vim.g.material_style = 'deep ocean'
vim.cmd 'colorscheme material'
-- 'oceanic', 'deep ocean', 'palenight', 'ligher',  darker
-- vim.g.material_style = 'darker'

vim.opt.termguicolors = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
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
-- vim.o.clipboard=unnamedplus
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

-- indent-blankline config
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

--Remap space as leader key
local map = require("options.utils").map
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>=', ':exe "resize +4" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>-', ':exe "resize -4" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>[', ':exe "vertical resize -30" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>]', ':exe "vertical resize +30" <CR>', { noremap = true, silent = true })

--Toggle colorschemes
vim.api.nvim_set_keymap('n', '<leader>ml', [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>md', [[<Cmd>lua require('material.functions').change_style('darker')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mo', [[<Cmd>lua require('material.functions').change_style('oceanic')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mdo', [[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mp', [[<Cmd>lua require('material.functions').change_style('palenight')<CR>]], { noremap = true, silent = true })
