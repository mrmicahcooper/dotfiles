require('options')
require('plugins')
require('cmp-config')

-- treesitter configuration
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust", "elixir", "html", "javascript", "css", "heex", "yaml", "markdown", "svelte", "hcl", "terraform" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
-- lualine configuration
require('lualine').setup {
  options = {
    theme = 'material'
  }
}

-- LSP settings
require('nvim-lsp-installer').setup({})
local lspconfig = require('lspconfig')
local LspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

local FormatOnSave = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = LspFormattingGroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = LspFormattingGroup,
    buffer = bufnr,
    -- on 0.8, you should use vim.lsp.buf.format instead
    callback = vim.lsp.buf.formatting_sync,
  })
end

-- initialize to false because format on save is manually added
local toggle_format_state = true

-- Toggle format on save for the current buffer
local ToggleFormatOnSave = function(bufnr)
  bufnr = vim.api.nvim_get_current_buf()

  if toggle_format_state then
    toggle_format_state = not toggle_format_state
    FormatOnSave(bufnr)
    vim.notify("FormatOnSave toggled on")
  else
    toggle_format_state = not toggle_format_state
    vim.api.nvim_clear_autocmds({ group = LspFormattingGroup, buffer = bufnr })
    vim.notify("FormatOnSave toggled off")
  end
end

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  --   vim.keymap.set('n', '<leader>wl', function()
  --     vim.inspect(vim.lsp.buf.list_workspace_folders())
  --   end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting_sync, {})
    vim.api.nvim_create_user_command("ToggleFormatOnSave", ToggleFormatOnSave, {})
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = {
  'rust_analyzer',
  'tsserver',
  'cssls',
  'lua_ls',
  'tailwindcss',
  'elixirls',
  'yamlls',
  'svelte',
  'terraformls'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
--
-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then
  lsp_signature.setup {
    bind = true,
    handler_opts = {
      border = "rounded",
    },
  }
end

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
  sources = {
    diagnostics.credo,
  },
})

-- -- config set at ./init.lua
-- require("indent_blankline").setup {
--   -- space_char_blankline = " ",
--   space_char_blankline = " ",
--   indent_blankline_filetype_exclude = { 'help', 'packer' },
--   indent_blankline_buftype_exclude = { 'terminal', 'nofile' },
--   indent_blankline_show_trailing_blankline_indent = false,
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--     "IndentBlanklineIndent2",
--     "IndentBlanklineIndent3",
--     "IndentBlanklineIndent4",
--     "IndentBlanklineIndent5",
--     "IndentBlanklineIndent6",
--   },
-- }
--

vim.cmd('source ~/.config/nvim/vim-test-config.vim')
vim.cmd('source ~/.config/nvim/projections.vimrc')
