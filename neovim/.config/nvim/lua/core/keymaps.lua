-- =========================================================
-- Keymaps
-- =========================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NERDTree
keymap('n', '<C-n>', ':NERDTreeToggle<CR>', opts)
keymap('n', '<C-f>', ':NERDTreeFind<CR>', opts)

-- Window navigation
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)

-- Buffer navigation
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Better indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
