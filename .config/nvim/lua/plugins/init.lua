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
  "wbthomason/packer.nvim",
  "khaveesh/vim-fish-syntax",
  "tpope/vim-unimpaired",
  "rcarriga/nvim-notify",
  "tpope/vim-endwise",
  "godlygeek/tabular",
  "evanleck/vim-svelte",

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
}
