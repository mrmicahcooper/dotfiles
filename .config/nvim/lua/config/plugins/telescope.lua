-- UI to select things (files, grep results, open buffers...)
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      extensions = {
        fzf = {
          override_generic_sorter = false, -- Causes crashes
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    -- Enable telescope fzf native
    telescope.load_extension("fzf")
    -- Replace vim ui select with telescope
    telescope.load_extension("ui-select")
  end,
}
