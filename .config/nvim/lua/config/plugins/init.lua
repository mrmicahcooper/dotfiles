return {
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "janko-m/vim-test",
  "jremmen/vim-ripgrep",
  "kyazdani42/nvim-web-devicons",
  "marko-cerovac/material.nvim",
  "nvim-lua/plenary.nvim",
  "tpope/vim-projectionist",
  "tpope/vim-surround", "vim-scripts/BufOnly.vim", "wbthomason/packer.nvim",
  "khaveesh/vim-fish-syntax", "tpope/vim-unimpaired", "rcarriga/nvim-notify", "tpope/vim-endwise",
  "godlygeek/tabular",
  "evanleck/vim-svelte",
  "vinnymeller/swagger-preview.nvim",
  "tpope/vim-dadbod",
  "tpope/vim-eunuch",
  "direnv/direnv.vim", "norcalli/nvim-colorizer.lua",

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "c",
          "eex",
          "elixir",
          "fish",
          "go",
          "bash",
          "gomod",
          "gosum",
          "graphql",
          "nu",
          "heex",
          "json",
          "lua",
          "hcl",
          "terraform",
          "ocaml",
          "query",
          "ruby",
          "rust",
          "julia",
          "toml",
          "typescript",
          "v",
          "vim",
          "vimdoc",
          "yaml",
        },
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              -- For example:
              -- Nushell only
              ["aP"] = "@pipeline.outer",
              ["iP"] = "@pipeline.inner",

              -- supported in other languages as well
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["aC"] = "@conditional.outer",
              ["iC"] = "@conditional.inner",
              ["iS"] = "@statement.inner",
              ["aS"] = "@statement.outer",
            }, -- keymaps
          }, -- select
        }, -- tex
      })
    end,
    build = ":TSUpdate"
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      require('render-markdown').setup({
        code = {
          conceal_delimiters = false
        }
      })
    end
  }

}
