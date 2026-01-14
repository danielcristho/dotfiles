-- =========================================================
-- CoC Configuration
-- =========================================================

-- CoC extensions
vim.g.coc_global_extensions = {
  'coc-snippets',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-json',
  'coc-yaml',
  'coc-emmet',
  'coc-css',
  'coc-html',
  'coc-python',
  'coc-pyright',
  'coc-go',
  '@yaegassy/coc-ansible',
  'coc-docker',
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Completion keymaps
keymap('i', '<Tab>', [[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]], { expr = true, silent = true })
keymap('i', '<S-Tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { expr = true, silent = true })
keymap('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { expr = true, silent = true })

-- Navigation
keymap('n', 'gd', '<Plug>(coc-definition)', opts)
keymap('n', 'gy', '<Plug>(coc-type-definition)', opts)
keymap('n', 'gi', '<Plug>(coc-implementation)', opts)
keymap('n', 'gr', '<Plug>(coc-references)', opts)

-- Documentation
keymap('n', 'K', ':call CocActionAsync("doHover")<CR>', opts)

-- Refactoring
keymap('n', '<leader>rn', '<Plug>(coc-rename)', opts)
keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', opts)
keymap('x', '<leader>ca', '<Plug>(coc-codeaction-selected)', opts)
keymap('n', '<leader>f', ':call CocActionAsync("format")<CR>', opts)

-- Diagnostics
keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
keymap('n', ']g', '<Plug>(coc-diagnostic-next)', opts)
keymap('n', '<leader>e', ':CocDiagnostics<CR>', opts)
