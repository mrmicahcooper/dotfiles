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
  }, 

  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {},
      nes = { enabled = false },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
    },
  }

}
