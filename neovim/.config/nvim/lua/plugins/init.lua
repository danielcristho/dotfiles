-- =========================================================
-- Plugin Manager (vim-plug)
-- =========================================================

-- Auto-install vim-plug if not found
local install_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing vim-plug...')
  vim.fn.system({
    'curl',
    '-fLo',
    install_path,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  print('vim-plug installed! Please restart Neovim and run :PlugInstall')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Core plugins
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('ryanoasis/vim-devicons')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
-- Plug('vimsence/vimsence')  -- Disabled: Discord presence (uncomment if needed)
Plug('wakatime/vim-wakatime')

-- File tree
Plug('preservim/nerdtree', { on = { 'NERDTreeToggle', 'NERDTreeFind' } })

-- Fuzzy Finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- Plug('nvim-treesitter/nvim-treesitter-textobjects', { ['do'] = ':TSUpdate' })  -- Disabled until treesitter is stable

-- Git Integration
Plug('lewis6991/gitsigns.nvim')
Plug('tpope/vim-fugitive')

-- Auto-pairs
Plug('windwp/nvim-autopairs')

-- Which-key
Plug('folke/which-key.nvim')

-- UI Enhancements
Plug('lukas-reineke/indent-blankline.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('stevearc/dressing.nvim')

-- Language plugins
Plug('gryf/pylint-vim', { ['for'] = 'python' })
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries', ['for'] = 'go' })
Plug('pearofducks/ansible-vim', { ['for'] = { 'yaml', 'yaml.ansible' } })
Plug('kkvh/vim-docker-tools', { ['for'] = 'dockerfile' })
Plug('ap/vim-css-color', { ['for'] = { 'css', 'html' } })

-- Colorschemes
Plug('ellisonleao/gruvbox.nvim')
Plug('sainnhe/gruvbox-material')
Plug('folke/tokyonight.nvim')
Plug('nordtheme/vim')
Plug('dylanaraps/wal.vim')
Plug('pineapplegiant/spaceduck', { branch = 'main' })

vim.call('plug#end')

-- Load plugin configurations
-- Load order matters: load dependencies first
pcall(require, 'plugins.gruvbox')
pcall(require, 'plugins.airline')
pcall(require, 'plugins.treesitter')
pcall(require, 'plugins.telescope')
pcall(require, 'plugins.gitsigns')
pcall(require, 'plugins.autopairs')
pcall(require, 'plugins.which-key')
pcall(require, 'plugins.ui')
pcall(require, 'plugins.coc')
pcall(require, 'plugins.golang')
pcall(require, 'plugins.ansible')
