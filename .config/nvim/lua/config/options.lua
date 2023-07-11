-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
-- Add any additional options here

vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.swapfile = false
vim.o.fileencoding = "utf-8"
vim.o.showtabline = 2
vim.wo.wrap = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.o.relativenumber = false
vim.o.conceallevel = 0

vim.cmd("source ~/.config/nvim/vim-test-config.vim")
vim.cmd("source ~/.config/nvim/projections.vimrc")

-- vim.api.nvim_set_keymap('n', '<c-P>',
--   "<cmd>lua require('fzf-lua').files()<CR>",
--   { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<c-B>',
--   "<cmd>lua require('fzf-lua').buffers()<CR>",
--   { noremap = true, silent = true })
--

-- vim.api.nvim_set_keymap('n', '<Leader>=', ':exe "resize +4" <CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>-', ':exe "resize -4" <CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>[', ':exe "vertical resize -30" <CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>]', ':exe "vertical resize +30" <CR>', { noremap = true, silent = true })

-- --Toggle colorschemes
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>ml",
--   [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>md",
--   [[<Cmd>lua require('material.functions').change_style('darker')<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>mo",
--   [[<Cmd>lua require('material.functions').change_style('oceanic')<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>mdo",
--   [[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>mp",
--   [[<Cmd>lua require('material.functions').change_style('palenight')<CR>]],
--   { noremap = true, silent = true }
--
-- )
