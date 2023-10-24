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
  Plug 'dylanaraps/wal.vim' "Install wal colorscheme

 
call plug#end()

" Basic configuration
set nocompatible " set vim compabilty
set nowrap " set no auto wrapping
set encoding=utf-8 " encoding
set number " show line numbers
set laststatus=2 " status bar
set shiftwidth=2 " indent
set tabstop=4 softtabstop=4 " 
"set relativenumber " set relative number
set noswapfile " set no swapfile

" Enable colorscheme
syntax on
colorscheme nord
"colorscheme wal
set background=dark

" Returns true if the color hex value is light
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')
  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
  return l:brightness > 155
endfunction

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

" Nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'

" Ansible highlight
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END

let g:ansible_extra_keywords_highlight = 1
let g:ansible_unindent_after_newline = 1



" Python virtualenv
let g:python3_host_prog='/usr/bin/python3'
