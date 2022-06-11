return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'marko-cerovac/material.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'janko-m/vim-test'
  use 'jremmen/vim-ripgrep'
  use 'tpope/vim-commentary'
  use 'tpope/vim-projectionist'
  use 'vim-scripts/BufOnly.vim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' }}
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
end)
