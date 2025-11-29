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
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

<<<<<<< HEAD
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && yarn install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
=======
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
>>>>>>> 8a7af08 (All work updates;/)

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      direction = "float",
      float_opts = {
        border = "double",
      },
      autochdir = true,
    }
  },

  {
  "ejrichards/mise.nvim",
    opts = {}
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
          -- "nu",
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
  }

}
