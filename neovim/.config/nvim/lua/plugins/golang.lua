-- =========================================================
-- Golang Configuration
-- =========================================================

-- Syntax highlighting
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_operators = 1

-- Formatting
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = 'goimports'
vim.g.go_auto_type_info = 1

-- Keymaps for Go files
local augroup = vim.api.nvim_create_augroup('GoKeymaps', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'go',
  callback = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true, buffer = true }
    
    keymap('n', '<leader>b', ':GoBuild<CR>', opts)
    keymap('n', '<leader>r', '<Plug>(go-run)', opts)
    keymap('n', '<leader>t', '<Plug>(go-test)', opts)
  end,
})
