# Neovim Cheatsheet

## Telescope

| Key | Action |
|-----|--------|
| `Ctrl+p` | Find files |
| `Space ff` | Find files |
| `Space fg` | Search in files (grep) |
| `Space fb` | Browse buffers |
| `Space fr` | Recent files |
| `Space fh` | Help docs |

## NERDTree

| Key | Action |
|-----|--------|
| `Ctrl+n` | Toggle NERDTree |
| `Ctrl+f` | Find current file |
| `m` | Menu (create/delete/move) |
| `o` | Open file/folder |
| `s` | Open in split |
| `i` | Open in vsplit |

## Code Intelligence (CoC)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show docs |
| `Space rn` | Rename |
| `Space ca` | Code action |
| `Space f` | Format |
| `[g` / `]g` | Prev/Next error |

## Git (Gitsigns)

| Key | Action |
|-----|--------|
| `]c` / `[c` | Next/Prev hunk |
| `Space hs` | Stage hunk |
| `Space hr` | Reset hunk |
| `Space hp` | Preview hunk |
| `Space hb` | Blame line |
| `Space tb` | Toggle blame |

## Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment |
| `gc` (visual) | Comment selection |
| `cs"'` | Change " to ' |
| `ds"` | Delete " |
| `ys<motion>"` | Add " around |
| `<` / `>` (visual) | Indent |
| `J` / `K` (visual) | Move lines |

## Windows & Buffers

| Key | Action |
|-----|--------|
| `Space h/j/k/l` | Navigate windows |
| `Tab` / `Shift+Tab` | Next/Prev buffer |
| `Ctrl+w s` | Split horizontal |
| `Ctrl+w v` | Split vertical |
| `Ctrl+w q` | Close window |

## Treesitter Selection

| Key | Action |
|-----|--------|
| `Enter` | Expand selection |
| `Backspace` | Shrink selection |
| `af` / `if` | Around/Inside function |
| `ac` / `ic` | Around/Inside class |
| `]m` / `[m` | Next/Prev function |

## Go Development

| Key | Action |
|-----|--------|
| `Space b` | Build |
| `Space r` | Run |
| `Space t` | Test |

## File Operations

| Key | Action |
|-----|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save & quit |
| `:q!` | Quit without save |

## Plugin Management

| Command | Action |
|---------|--------|
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused |
| `:TSUpdate` | Update Treesitter |
| `:CocInstall <ext>` | Install CoC extension |

## Themes

Current: **Gruvbox Dark**

Switch themes:
```vim
:colorscheme tokyonight
:colorscheme nord
:colorscheme gruvbox-material
```

## Help

| Command | Action |
|---------|--------|
| `:help <topic>` | Show help |
| `:Telescope help_tags` | Search help |
| `:checkhealth` | Check Neovim health |
| `:CocInfo` | CoC info |
