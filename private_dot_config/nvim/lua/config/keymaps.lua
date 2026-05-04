local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("t", "<cmd>w", "<cmd>\\ <cmd>n> <cmd>w")

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- copy to end of line
map("n", "Y", "y$")
-- copy to system clipboard
map("v", "gy", '"+y')
-- copy whole file to system clipboard
map("n", "gY", 'gg"+yG')

map("n", "<space>", "<nop>")
map("v", "<space>", "<nop>")

map("n", "<leader>=", "<cmd>exe 'resize +4' <cr>")
map("n", "<leader>-", "<cmd>exe 'resize -4' <cr>")
map("n", "<leader>[", "<cmd>exe 'vertical resize -30' <cr>")
map("n", "<leader>]", "<cmd>exe 'vertical resize +30' <cr>")

map("n", "<leader>t", "<cmd>w | TestFile<cr>")
map("n", "<leader>T", "<cmd>w | TestNearest<CR>")
map("n", "<leader>ts", "<cmd>w | TestSuite<cr>")
map("n", "<leader>l", "<cmd>w | TestLast<cr>")

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

vim.keymap.set("n", "<leader>2", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, wrap = true })
end, { desc = "Next Warning" })

vim.keymap.set("n", "<leader>1", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true })
end, { desc = "Next Warning" })


-- vim dadbod
map("n", "<leader>d", ":%DB sqlite:~/code/fam/data/fam_test.db<cr>")

--change colorschemes
map("n", "<leader>cl", "<cmd>colorscheme catppuccin-latte<cr>")
map("n", "<leader>cf", "<cmd>colorscheme catppuccin-frappe<cr>")
map("n", "<leader>cm", "<cmd>colorscheme catppuccin-macchiato<cr>")
map("n", "<leader>co", "<cmd>colorscheme catppuccin-mocha<cr>")
map("n", "<leader>mo", "<cmd>colorscheme material-oceanic<cr>")
map("n", "<leader>mdo", "<cmd>colorscheme material-deep-ocean<cr>")
map("n", "<leader>mp", "<cmd>colorscheme material-palenight<cr>")
map("n", "<leader>ml", "<cmd>colorscheme material-lighter<cr>")
map("n", "<leader>md", "<cmd>colorscheme material-darker<cr>")

map("n", "<leader><space>", "<cmd>Telescope find_files<cr>")
map("n", "<c-f>", "<cmd>Telescope live_grep<cr>")
map("n", "<c-b>", "<cmd>Telescope buffers<cr>")

map("n", "<leader>gb", "<cmd>Git blame<cr>")
map("n", "<leader>ge", "<cmd>Gedit:<cr>")
map("n", "<leader>gw", "<cmd>Gwrite<cr>")
