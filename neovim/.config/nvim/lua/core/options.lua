-- =========================================================
-- Editor Options
-- =========================================================

local opt = vim.opt

-- General
opt.compatible = false
opt.mouse = 'a'
opt.hidden = true
opt.autowrite = true
opt.encoding = 'utf-8'
opt.fileformat = 'unix'

-- UI
opt.number = true
opt.wrap = false
opt.termguicolors = true
opt.background = 'dark'
opt.laststatus = 2
opt.signcolumn = 'yes'

-- Files
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Indentation (default)
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Completion
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.updatetime = 300
opt.timeoutlen = 500
