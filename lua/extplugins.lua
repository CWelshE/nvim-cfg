-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

vim.api.nvim_exec(
  [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Nightly improvements
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'

  -- Code Actions fanciness
  use 'weilbith/nvim-code-action-menu'
  use 'kosayoda/nvim-lightbulb'

  -- Telescope searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'BurntSushi/ripgrep'

  -- Visuals-related
  use 'editorconfig/editorconfig-vim'
  use 'sainnhe/everforest'
  use 'nvim-lualine/lualine.nvim'

  -- Text modification-related
  use 'godlygeek/tabular'
  use 'nvim-lua/completion-nvim'
  use 'windwp/nvim-autopairs'

  -- Code snippet completion
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'

  -- Emmet completion
  use 'mattn/emmet-vim'

  -- Tim Pope plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'

  -- Elixir
  use 'elixir-editors/vim-elixir'
  use 'mhinz/vim-mix-format'
  use 'slashmili/alchemist.vim'

  -- Fancy blank lines like in some IDEs
  use 'lukas-reineke/indent-blankline.nvim'

  -- Slightly better indentation handling for JS/others
  use 'sheerun/vim-polyglot'

  -- Dev icons for patched typefaces which have them
  use 'kyazdani42/nvim-web-devicons'

  use 'rmagatti/auto-session'
  use 'evanleck/vim-svelte'

  -- It's actual nvim in the browser! Fancy.
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  use 'akinsho/bufferline.nvim'
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
