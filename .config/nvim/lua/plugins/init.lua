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
  use 'khaveesh/vim-fish-syntax'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  use 'rcarriga/nvim-notify'
  use 'tpope/vim-endwise'
  use 'godlygeek/tabular'
  use 'evanleck/vim-svelte'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

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

  --vim-cmp (autocomplete)
  --Plug 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  
  -- Snippets
  use { 'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets" -- Community snippets
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end


end)
