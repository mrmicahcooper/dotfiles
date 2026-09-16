return {

  -- "norcalli/nvim-colorizer.lua",
  -- "tpope/vim-vinegar",

  -- colorschemes
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("catppuccin-mocha")
      vim.cmd.colorscheme("everforest")
      -- vim.cmd.colorscheme("catppuccin-latte")
    end,
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        --background = "medium",
        -- background = "hard",
        -- background = "soft",
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = { char = "┊" },
      })
    end
  },


}

