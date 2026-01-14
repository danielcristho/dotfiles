-- =========================================================
-- Telescope Configuration
-- =========================================================

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = '🔍 ',
    selection_caret = '➜ ',
    path_display = { 'smart' },
    file_ignore_patterns = {
      'node_modules',
      '.git/',
      'dist/',
      'build/',
      '%.lock',
    },
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<C-q>'] = 'send_to_qflist',
        ['<Esc>'] = 'close',
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

-- Load extensions
pcall(telescope.load_extension, 'fzf')

-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', opts)
keymap('n', '<leader>fc', '<cmd>Telescope commands<cr>', opts)
keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)
