return {
  "norcalli/nvim-colorizer.lua",
  -- "tpope/vim-vinegar",

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
      -- vim.cmd.colorscheme("catppuccin-latte")
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
