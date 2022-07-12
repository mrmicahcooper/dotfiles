local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then PACKER_BOOTSTRAP = fn.system { 'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'janko-m/vim-test'
  use 'jremmen/vim-ripgrep'
  use 'kyazdani42/nvim-web-devicons'
  use 'marko-cerovac/material.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-surround'
  use 'vim-scripts/BufOnly.vim'
  use 'wbthomason/packer.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'khaveesh/vim-fish-syntax'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  use 'rcarriga/nvim-notify'
  use 'tpope/vim-endwise'
  use 'godlygeek/tabular'
  use 'lukas-reineke/indent-blankline.nvim'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- use {
  --   "nanozuki/tabby.nvim",
  --   config = function() require("tabby").setup() end,
  -- }
  --
  use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'nvim-treesitter/nvim-treesitter-textobjects' }
  }

-- Add indentation guides even on blank lines

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        current_line_blame = false,
        yadm = {
          enable = true
        },
      }
    end
  }

  -- LSP installer and lspconfig. install/load installer before config
  use { 'neovim/nvim-lspconfig',
    requires = { 'williamboman/nvim-lsp-installer' }
  }

  -- null ls
  use { 'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Elixir specific
  use { 'mhanberg/elixir.nvim',
    requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', }
  }

end)
