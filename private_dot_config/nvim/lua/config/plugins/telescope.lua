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
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
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
