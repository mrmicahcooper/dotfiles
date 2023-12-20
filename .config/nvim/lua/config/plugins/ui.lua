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
    end,
  },

  -- Fancy statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = "|",
          globalstatus = true,
          always_divide_middle = true,
        },
        sections = {
          lualine_c = { '%F' }
        },
        tabline = {
          lualine_a = { { "tabs", mode = 1 } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          "quickfix",
          "fugitive",
        },
      })
    end,
  },

  -- Add indentation guides even on blank lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      vim.g.indent_blankline_char = "┊"
      vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end,
  },
}
