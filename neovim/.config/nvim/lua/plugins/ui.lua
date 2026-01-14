-- =========================================================
-- UI Enhancements Configuration
-- =========================================================

-- Indent Blankline
local indent_status, indent_blankline = pcall(require, 'ibl')
if indent_status then
  indent_blankline.setup({
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  })
end

-- Colorizer
local colorizer_status, colorizer = pcall(require, 'colorizer')
if colorizer_status then
  colorizer.setup({
    '*',
  }, {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
    mode = 'background',
  })
end

-- Dressing (better UI for input/select)
local dressing_status, dressing = pcall(require, 'dressing')
if dressing_status then
  dressing.setup({
    input = {
      enabled = true,
      default_prompt = '➤ ',
      prompt_align = 'left',
      insert_only = true,
      start_in_insert = true,
      border = 'rounded',
      relative = 'cursor',
      prefer_width = 40,
      width = nil,
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },
      win_options = {
        winblend = 10,
        wrap = false,
      },
    },
    select = {
      enabled = true,
      backend = { 'telescope', 'builtin' },
      trim_prompt = true,
      telescope = nil,
      builtin = {
        border = 'rounded',
        relative = 'editor',
        win_options = {
          winblend = 10,
        },
        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },
      },
    },
  })
end
