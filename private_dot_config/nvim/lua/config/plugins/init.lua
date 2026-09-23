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
  "tpope/vim-surround",
  "vim-scripts/BufOnly.vim",
  "khaveesh/vim-fish-syntax",
  "tpope/vim-unimpaired",
  "tpope/vim-endwise",
  "godlygeek/tabular",
  "evanleck/vim-svelte",
  "vinnymeller/swagger-preview.nvim",
  "tpope/vim-dadbod", "tpope/vim-eunuch",
  "catgoose/nvim-colorizer.lua",

  {
    "carldaws/miser.nvim",
    config = function()
      require("miser").setup()
    end
  },

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
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Install parsers
      require("nvim-treesitter").install {
        "bash",
        "c",
        "eex",
        "elixir",
        "fish",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "hcl",
        "heex",
        "json",
        "julia",
        "lua",
        "nu",
        "ocaml",
        "query",
        "ruby",
        "rust",
        "terraform",
        "toml",
        "typescript",
        "v",
        "vim",
        "vimdoc",
        "yaml",
      }

      -- Enable treesitter highlighting and indentation for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup {}

      local select = require("nvim-treesitter-textobjects.select")

      -- Nushell only
      vim.keymap.set({ "x", "o" }, "aP", function() select.select_textobject("@pipeline.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "iP", function() select.select_textobject("@pipeline.inner", "textobjects") end)

      -- Supported in other languages as well
      vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "aC", function() select.select_textobject("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "iC", function() select.select_textobject("@conditional.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "iS", function() select.select_textobject("@statement.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "aS", function() select.select_textobject("@statement.outer", "textobjects") end)
    end,
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        win = {
          layout = "left",
          width = 0.4
        }
        -- mux = {
        --   enabled = true,
        --   backend = "zellij"
        --
        -- }
      },
      nes = { enabled = false },
    },
    keys = {
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
      -- Example of a keybinding to open opencode directly
      {
        "<leader>ac",
        function() require("sidekick.cli").toggle({ name = "opencode", focus = true }) end,
        desc = "Sidekick Toggle Opencode",
      },
    },
  }

}
