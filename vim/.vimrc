call plug#begin('~/.vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete plugin. similar to VSCode
  Plug 'https://github.com/gryf/pylint-vim' " Pylint plugins
  Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' } " Directories hierarchies
  Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
  Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
  Plug 'ryanoasis/vim-devicons'
  Plug 'vimsence/vimsence' " Discord presence
  Plug 'wakatime/vim-wakatime' " Wakatime plugins
  Plug 'http://github.com/tpope/vim-surround' " Surrounding vim
  Plug 'vim-airline/vim-airline' " Status bar
  Plug 'vim-airline/vim-airline-themes' " Airline theme
  Plug 'sansyrox/vim-python-virtualenv' "manage python virtualenv
  Plug 'pearofducks/ansible-vim' " Ansible Plugin
  Plug 'kkvh/vim-docker-tools' " Docker Plugin
  Plug 'valloric/youcompleteme' " Other Autocomplete
  Plug 'sainnhe/gruvbox-material' " Install gruvbox-material colorscheme 
  Plug 'morhetz/gruvbox' " Install gruvbox colorscheme
  Plug 'folke/tokyonight.nvim' " Install tokyonight colorscheme
  Plug 'nordtheme/vim' " Install nord colorscheme 
  Plug 'dylanaraps/wal.vim' " Install wal colorscheme
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } " Install spaceduck colorscheme
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Basic configuration 
syntax on
set nocompatible " set vim compabilty
set nowrap " set no auto wrapping
set number " show line numbers
set laststatus=2 " status bar
"set relativenumber " set relative number
set noswapfile " set no swapfile
"set clipboard=unnamed " set no copy linenumber
se mouse+=a " sst no copy line no copy linenumber 
set fileformat=unix
set encoding=UTF-8 " encoding
set autowrite 
" indent for *.py
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

highlight VertSplit ctermbg=none ctermfg=blue

"-- Indentline Config
let g:indentLine_color_gui = '#423d38'
let g:indentLine_setConceal = 0
let g:indentLine_char = '|'

" Returns true if the color hex value is light
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')
  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
  return l:brightness > 155
endfunction

" Enable colorscheme
colorscheme gruvbox 
set termguicolors
let g:gruvbox_italic=1
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921',
    \ '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-pyright',
  \ 'coc-go',
  \ '@yaegassy/coc-ansible',
  \ 'coc-docker',
  \ ]

" Emmet Config
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
" let g:NERDTreeClipboardFlag = 0

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Ansible highlight
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END

let g:ansible_extra_keywords_highlight = 1
let g:ansible_unindent_after_newline = 1
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }

" Golang Config
filetype plugin indent on

“ Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

“ Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

“ Map keys for most used commands.
“ Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Python virtualenv
let g:python3_host_prog='/usr/bin/python3'
