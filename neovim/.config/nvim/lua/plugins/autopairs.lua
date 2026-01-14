-- =========================================================
-- Autopairs Configuration
-- =========================================================

local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
})

-- Integration with CoC
local coc_status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.coc')
if coc_status_ok then
  cmp_autopairs.setup()
end
