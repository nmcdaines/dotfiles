-- ensure packer.nvim is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua


-- load config
function get_setup(name)
  return string.format('require("setup/%s")', name)
end


-- plugins
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- theme
  use {
    'folke/tokyonight.nvim',
    branch = 'main'
  }
  use {'kyazdani42/nvim-web-devicons'}

  -- code -> abstract syntax trees
  use {
    'nvim-treesitter/nvim-treesitter',
    config = get_setup("treesitter"),
    run = ':TSUpdate'
  }
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = get_setup("autopairs"),
  })

  -- lsp
  use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
  use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })

  -- code completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip-integ" },
      { "f3fora/cmp-spell" },
      { "octaltree/cmp-look" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-emoji" },
    },
    config = get_setup("cmp"),
  })  

  -- search and exploration
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = get_setup("tree"),
  }

  -- ?? ctrl p

  -- use {
  --   'junegunn/fzf.vim',
  --   requires = {
  --     '/usr/local/opt/fzf'
  --   },
  --   setup = function()
  --     vim.g.fzf_history_dir = '~/.local/share/fzf-vim-history'
  --     -- vim.cmd([[let $FZF_DEFAULT_OPTS='--layout=reverse']])
  --   end,
  --   config = function()
  --     vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { silent = true })
  --     vim.api.nvim_set_keymap('n', ';', ':Buffers<CR>', { silent = true })
  --     vim.api.nvim_set_keymap('n', '<C-g>', ':BLines<CR>', { silent = true })
  --   end
  -- }

  -- zen mode
  use {'junegunn/goyo.vim'}

  -- utils
  use {'tpope/vim-commentary'}

  -- other
  use {'junegunn/limelight.vim'}
  use {'tpope/vim-markdown'}
  use {'ap/vim-css-color'}
  use {'https://github.com/shmargum/vim-sass-colors.git'}
  use {'romgrk/barbar.nvim'}
 
  -- Ruby
  use {'tpope/vim-rails'}
  use {'tpope/vim-bundler'}
  use {'tpope/vim-cucumber'}


  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    config = get_setup("telescope")
  }
  
  -- ThePrimeagen 
  use {
    'ThePrimeagen/harpoon',
    config = get_setup("harpoon")
  }
  
  use {'OmniSharp/Omnisharp-vim'}

  use "rafamadriz/friendly-snippets"

  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
end)
