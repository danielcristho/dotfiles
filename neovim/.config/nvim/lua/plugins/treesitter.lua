-- =========================================================
-- Treesitter Configuration
-- =========================================================

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup({
  -- Install parsers
  ensure_installed = {
    'lua',
    'vim',
    'vimdoc',
    'python',
    'javascript',
    'typescript',
    'go',
    'rust',
    'bash',
    'json',
    'yaml',
    'toml',
    'html',
    'css',
    'markdown',
    'dockerfile',
  },
  
  -- Install parsers synchronously
  sync_install = false,
  
  -- Automatically install missing parsers
  auto_install = true,
  
  -- Use pre-compiled binaries when available
  prefer_git = false,
  
  -- Highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  -- Indentation
  indent = {
    enable = true,
  },
  
  -- Incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<S-CR>',
      node_decremental = '<BS>',
    },
  },
  
  -- Text objects (disabled until plugin is enabled)
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true,
  --     keymaps = {
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true,
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  -- },
})

-- Enable folding based on treesitter
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false -- Don't fold by default
