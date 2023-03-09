call plug#begin('~/.vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete plugin. similar to VSCode
  Plug 'https://github.com/gryf/pylint-vim' "Pylint plugins
  Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' } " Directories hierarchies
  Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
  Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
  Plug 'morhetz/gruvbox' " Install color scheme: gruvbox
  Plug 'folke/tokyonight.nvim' " Install color scheme tokyonight
  Plug 'ryanoasis/vim-devicons'
  Plug 'vimsence/vimsence' " Discord presence
  Plug 'wakatime/vim-wakatime' " Wakatime plugins
  Plug 'http://github.com/tpope/vim-surround' " Surrounding vim
  Plug 'vim-airline/vim-airline' " Status bar
  Plug 'vim-airline/vim-airline-themes' " Airline theme

call plug#end()

" Basic configuration
set nocompatible " set vim compabilty
set wrap " set auto wrapping
set encoding=utf-8 " encoding
set number " show line numbers
set laststatus=2 " status bar
set shiftwidth=2 " indent

" Enable colorscheme
syntax on
colorscheme gruvbox
set background=dark

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'

"coc config
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

