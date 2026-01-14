-- =========================================================
-- Gruvbox Theme Configuration (ellisonleao/gruvbox.nvim)
-- =========================================================

local status_ok, gruvbox = pcall(require, 'gruvbox')
if not status_ok then
  -- Fallback to old gruvbox if new one not installed
  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_contrast_dark = 'medium'
  vim.g.gruvbox_transparent_bg = 1
  vim.cmd([[colorscheme gruvbox]])
  return
end

-- Setup gruvbox.nvim
gruvbox.setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true,
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    -- Transparent background
    Normal = { bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    -- Better vertical split
    VertSplit = { fg = "#458588", bg = "NONE" },
  },
  dim_inactive = false,
  transparent_mode = true,
})

-- Set colorscheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
