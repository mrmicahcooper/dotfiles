require('options')
require('plugins')
require('mason').setup()
require("mason-lspconfig").setup()
require('cmp-config')

-- treesitter configuration
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'css',
    'elixir',
    'hcl',
    'heex',
    'html',
    'javascript',
    'lua',
    'markdown',
    'rust',
    'svelte',
    'terraform',
    'yaml'
  },
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
local LspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

local FormatOnSave = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = LspFormattingGroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = LspFormattingGroup,
    buffer = bufnr,
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

on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  if client.supports_method("textDocument/formatting") then
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting_sync, {})
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting_sync, {})
    vim.api.nvim_create_user_command("ToggleFormatOnSave", ToggleFormatOnSave, {})
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities
      } 
    end,

    ["null-ls"] = function ()
      require("null").setup {}
    end
}

local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then
  lsp_signature.setup {
    bind = true,
    handler_opts = {
      border = "rounded",
    },
  }
end

vim.cmd('source ~/.config/nvim/vim-test-config.vim')
vim.cmd('source ~/.config/nvim/projections.vimrc')
