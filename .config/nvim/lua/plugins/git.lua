return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    opts = {
      current_line_blame = false,
      yadm = {
        enable = true,
      },
    },
  },

  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },

  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
}
