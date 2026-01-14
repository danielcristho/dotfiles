" =========================================================
" Plugins
" =========================================================
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}      " LSP / Autocomplete
Plug 'gryf/pylint-vim'                               " Pylint
Plug 'preservim/nerdtree'                            " File tree
Plug 'ap/vim-css-color'                              " CSS color preview
Plug 'tpope/vim-commentary'                          " gcc / gc comments
Plug 'tpope/vim-surround'                            " cs, ds, ys
Plug 'ryanoasis/vim-devicons'                        " Icons
Plug 'vimsence/vimsence'                             " Discord presence
Plug 'wakatime/vim-wakatime'                         " Wakatime
Plug 'vim-airline/vim-airline'                       " Statusline
Plug 'vim-airline/vim-airline-themes'                " Airline themes
Plug 'pearofducks/ansible-vim'                       " Ansible
Plug 'kkvh/vim-docker-tools'                         " Docker
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " Golang

" Colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'nordtheme/vim'
Plug 'dylanaraps/wal.vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

call plug#end()

" =========================================================
" Editor Settings
" =========================================================
set nocompatible
syntax on
set number
set nowrap
set noswapfile
set laststatus=2
set mouse+=a
set fileformat=unix
set encoding=utf-8
set autowrite
filetype plugin indent on

" =========================================================
" Python Indentation 
" =========================================================
augroup python_indent
  autocmd!
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

" =========================================================
" Colors & UI
" =========================================================
set termguicolors
set background=dark
colorscheme gruvbox

let g:gruvbox_italic = 1
hi Normal guibg=NONE ctermbg=NONE
highlight VertSplit ctermbg=NONE ctermfg=blue

let g:terminal_ansi_colors = [
\ '#282828', '#cc241d', '#98971a', '#d79921',
\ '#458588', '#b16286', '#689d6a', '#a89984',
\ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
\ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]

" =========================================================
" Airline
" =========================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" =========================================================
" Coc.nvim
" =========================================================
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-emmet',
\ 'coc-css',
\ 'coc-html',
\ 'coc-python',
\ 'coc-pyright',
\ 'coc-go',
\ '@yaegassy/coc-ansible',
\ 'coc-docker',
\ ]

" =========================================================
" Emmet
" =========================================================
let g:user_emmet_settings = {
\ 'javascript': {
\   'extends': 'jsx',
\ },
\}

" =========================================================
" NERDTree
" =========================================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * if argc() == 0 | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') | quit | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" =========================================================
" Ansible
" =========================================================
augroup ansible_ft
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END

let g:ansible_extra_keywords_highlight = 1
let g:ansible_unindent_after_newline = 1
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }

" =========================================================
" Golang
" =========================================================
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nnoremap <leader>b :call <SID>build_go_files()<CR>
autocmd FileType go nnoremap <leader>r <Plug>(go-run)
autocmd FileType go nnoremap <leader>t <Plug>(go-test)

" =========================================================
" Python Host
" =========================================================
let g:python3_host_prog = '/usr/bin/python3.13'
