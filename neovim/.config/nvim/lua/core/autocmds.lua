-- =========================================================
-- Autocommands
-- =========================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Python indentation
local python_group = augroup('PythonIndent', { clear = true })
autocmd('FileType', {
  group = python_group,
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Ansible filetype detection
local ansible_group = augroup('AnsibleFiletype', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = ansible_group,
  pattern = 'hosts',
  command = 'setfiletype yaml.ansible',
})

-- NERDTree auto-close when it's the last window
local nerdtree_group = augroup('NERDTreeAuto', { clear = true })
autocmd('BufEnter', {
  group = nerdtree_group,
  callback = function()
    if vim.fn.tabpagenr('$') == 1 and vim.fn.winnr('$') == 1 and vim.fn.exists('b:NERDTree') == 1 then
      vim.cmd('quit')
    end
  end,
})

-- Highlight on yank
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})
