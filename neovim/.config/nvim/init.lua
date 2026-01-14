-- =========================================================
-- Neovim Config
-- =========================================================

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Set Python3 host (auto-detect or use specific path)
local python3_path = vim.fn.exepath('python3')
if python3_path ~= '' then
    vim.g.python3_host_prog = python3_path
end

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core configurations
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugin manager
require('plugins')
