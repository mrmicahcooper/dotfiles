return {
  "folke/noice.nvim",
  require("noice").setup({
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
    }
  })
}
