-- =========================================================
-- Which-key Configuration
-- =========================================================

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = '»',
    separator = '➜',
    group = '+',
  },
  window = {
    border = 'rounded',
    position = 'bottom',
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = 'left',
  },
  show_help = true,
  triggers = 'auto',
})

-- Register key mappings with descriptions
which_key.register({
  ['<leader>'] = {
    f = {
      name = 'Find',
      f = { 'Find Files' },
      g = { 'Live Grep' },
      b = { 'Buffers' },
      h = { 'Help Tags' },
      r = { 'Recent Files' },
      c = { 'Commands' },
      k = { 'Keymaps' },
    },
    h = {
      name = 'Git Hunk',
      s = { 'Stage Hunk' },
      r = { 'Reset Hunk' },
      S = { 'Stage Buffer' },
      u = { 'Undo Stage' },
      R = { 'Reset Buffer' },
      p = { 'Preview Hunk' },
      b = { 'Blame Line' },
      d = { 'Diff This' },
      D = { 'Diff This ~' },
    },
    g = {
      name = 'Git',
      s = { 'Git Status' },
      h = { 'Diff Get Left' },
      l = { 'Diff Get Right' },
    },
    c = {
      name = 'Code',
      a = { 'Code Action' },
    },
    r = {
      name = 'Refactor',
      n = { 'Rename' },
    },
    t = {
      name = 'Toggle',
      b = { 'Git Blame' },
      d = { 'Git Deleted' },
    },
    e = { 'Diagnostics' },
  },
  g = {
    name = 'Go to',
    d = { 'Definition' },
    y = { 'Type Definition' },
    i = { 'Implementation' },
    r = { 'References' },
  },
  ['['] = {
    name = 'Previous',
    g = { 'Diagnostic' },
    c = { 'Git Hunk' },
    m = { 'Function Start' },
    M = { 'Function End' },
  },
  [']'] = {
    name = 'Next',
    g = { 'Diagnostic' },
    c = { 'Git Hunk' },
    m = { 'Function Start' },
    M = { 'Function End' },
  },
})
