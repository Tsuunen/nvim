vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use("wbthomason/packer.nvim")

  -- dependencies
  use("nvim-lua/plenary.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("MunifTanjim/nui.nvim")

  -- colorscheme
  use({
    "navarasu/onedark.nvim",
    config = function()
      vim.cmd("colorscheme onedark")
  end
  })

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Auto-pairs
  use("jiangmiao/auto-pairs")

  -- commentary
  use("tpope/vim-commentary")

  -- undotree
  use("mbbill/undotree")

  -- Git
  use("tpope/vim-fugitive")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- color viewer
  use("norcalli/nvim-colorizer.lua")

  use("lukas-reineke/indent-blankline.nvim")

  -- error gui
  use("folke/trouble.nvim")

  -- fuzzy finder
  use({'nvim-telescope/telescope.nvim', tag = '0.1.x'})

  -- file explorer
  use({"nvim-neo-tree/neo-tree.nvim", branch = "v2.x"})

  -- toggleterm
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- rust tools
  use("simrat39/rust-tools.nvim")

  -- live server
  use("barrett-ruth/live-server.nvim")

  use("mfussenegger/nvim-jdtls")
end)
