return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },

      ensure_installed = {
        "denols",
        "rust_analyzer",
        "tsserver",
        "solargraph",
        "gopls",
        "vls",
        "jsonls",
        "lua_ls",
        "elixirls",
      },
    },
    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require("mason-lspconfig").setup({ ensure_installed = opts.ensure_installed })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, buffer)
              require("plugins.lsp.format").on_attach(client, buffer)
              require("plugins.lsp.keymaps").on_attach(client, buffer)
            end,
          })
        end,
        ["tsserver"] = function()
          require("lspconfig").tsserver.setup({
            capabilities = capabilities,
            on_attach = function(client, buffer)
              require("plugins.lsp.format").on_attach(client, buffer)
              require("plugins.lsp.keymaps").on_attach(client, buffer)
            end,
            root_dir = require("lspconfig").util.root_pattern("package.json"),
            single_file_support = false,
          })
        end,
        ["denols"] = function()
          require("lspconfig").denols.setup({
            capabilities = capabilities,
            on_attach = function(client, buffer)
              require("plugins.lsp.format").on_attach(client, buffer)
              require("plugins.lsp.keymaps").on_attach(client, buffer)
            end,
            root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
          })
        end,
      })

      require("lspconfig").nim_langserver.setup({
        capabilities = capabilities,
        on_attach = function(client, buffer)
          require("plugins.lsp.format").on_attach(client, buffer)
          require("plugins.lsp.keymaps").on_attach(client, buffer)
        end,
      })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.diagnostics.credo,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.rubocop,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.nimpretty,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason" } },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
}
