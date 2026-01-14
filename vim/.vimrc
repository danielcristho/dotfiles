let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" =========================================================
" Plugins
" =========================================================
call plug#begin('~/.vim/plugged')

" Core
Plug 'neoclide/coc.nvim', {'branch': 'release'}      " LSP / Autocomplete
Plug 'tpope/vim-commentary'                          " gcc / gc
Plug 'tpope/vim-surround'                            " cs ds ys
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimsence/vimsence'
Plug 'wakatime/vim-wakatime'

" File tree (lazy)
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Language plugins (lazy by filetype)
Plug 'gryf/pylint-vim',                { 'for': 'python' }
Plug 'fatih/vim-go',                   { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'pearofducks/ansible-vim',         { 'for': ['yaml', 'yaml.ansible'] }
Plug 'kkvh/vim-docker-tools',           { 'for': 'dockerfile' }
Plug 'ap/vim-css-color',                { 'for': ['css', 'html'] }

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
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
filetype plugin indent on

set number
set nowrap
set noswapfile
set mouse+=a
set laststatus=2
set encoding=utf-8
set fileformat=unix
set autowrite
set hidden

let mapleader=" "

" =========================================================
" Python Indentation
" =========================================================
augroup python_indent
  autocmd!
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

" =========================================================
" UI & Colors
" =========================================================
set termguicolors
set background=dark
colorscheme gruvbox

let g:gruvbox_italic = 1
hi Normal guibg=NONE ctermbg=NONE
highlight VertSplit ctermbg=NONE ctermfg=blue

" =========================================================
" Airline
" =========================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" =========================================================
" Coc.nvim Configuration
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
" Coc Completion
" =========================================================
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" =========================================================
" Coc Navigation & Actions
" =========================================================
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>ca <Plug>(coc-codeaction)
xnoremap <leader>ca <Plug>(coc-codeaction-selected)
nnoremap <leader>f  :call CocActionAsync('format')<CR>

nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>e :CocDiagnostics<CR>

" =========================================================
" NERDTree
" =========================================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * if argc() == 0 | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') | quit | endif

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
