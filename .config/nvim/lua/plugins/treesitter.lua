-- Treesitter configuration
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "eex",
        "elixir",
        "fish",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "heex",
        "json",
        "lua",
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
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

