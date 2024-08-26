-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	"rebelot/kanagawa.nvim",
	as = 'kanagawa',
	config = function()
		vim.cmd("colorscheme kanagawa")
	end
  }

  use {'nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'}}
  -- use {
  --     'VonHeikemen/lsp-zero.nvim',
  --     branch = 'v3.x',
  --     requires = {
  --         --- Uncomment these if you want to manage LSP servers from neovim
  --         {'williamboman/mason.nvim'},
  --         {'williamboman/mason-lspconfig.nvim'},
  --
  --         -- LSP Support
  --         {'neovim/nvim-lspconfig'},
  --         -- Autocompletion
  --         {'hrsh7th/nvim-cmp'},
  --         {'hrsh7th/cmp-nvim-lsp'},
  --         {'L3MON4D3/LuaSnip'},
  --     }
  -- }
  use {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/nvim-cmp'}
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      }
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use "lukas-reineke/indent-blankline.nvim"
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

end)
