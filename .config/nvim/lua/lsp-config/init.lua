-- LSP settings
local lspconfig = require 'lspconfig'

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
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting_sync, {})
    vim.api.nvim_create_user_command("ToggleFormatOnSave", ToggleFormatOnSave, {})
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'solargraph' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local elixir = require("elixir")
elixir.setup({
  -- default settings, use the `settings` function to override settings
  settings = elixir.settings({
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = false,
    suggestSpecs = false,
  }),


  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local map_opts = { buffer = true, noremap = true }
    -- run the codelens under the cursor
    vim.keymap.set("n", "<space>r", vim.lsp.codelens.run, map_opts)
    -- remove the pipe operator
    vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
    -- add the pipe operator
    vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
    vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

    -- standard lsp keybinds
    -- vim.keymap.set("n", "df", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", map_opts)
    -- vim.keymap.set("n", "gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
    -- vim.keymap.set("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
    -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
    -- vim.keymap.set("n", "gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
    -- vim.keymap.set("n", "1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
    -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
    -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
    -- there are also core vim.lsp functions that put the same data in the loclist
    -- vim.keymap.set("n", "gr", ":References<cr>", map_opts)
    -- vim.keymap.set("n", "g0", ":DocumentSymbols<cr>", map_opts)
    -- vim.keymap.set("n", "gW", ":WorkspaceSymbols<cr>", map_opts)
    -- vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)

    -- keybinds for vim-vsnip: https://github.com/hrsh7th/vim-vsnip
    -- vim.cmd([[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
    -- vim.cmd([[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

    -- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
    require("cmp_nvim_lsp").update_capabilities(capabilities)
  end
})

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
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       -- on 0.8, you should use vim.lsp.buf.format instead
  --       callback = vim.lsp.buf.formatting_sync,
  --     })
  --   end
  -- end,
})

