return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    event = "BufReadPre",
    opts = {
      current_line_blame = false,
      yadm = {
        enable = true,
      },
    },
  },

  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },
}
