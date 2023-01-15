set nocompatible " set vim compabilty
set wrap " set auto wrapping
set encoding=utf-8 " encoding
set number " show line numbers
set laststatus=2 " status bar
set shiftwidth=2 " indent

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete plugin. similar to VSCode
  Plug 'https://github.com/gryf/pylint-vim' "Pylint plugin
  Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'} "Ansible plugins
  Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' } " Directories hierarchies
  Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
  Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
  Plug 'https://github.com/morhetz/gruvbox' " Install color scheme
  Plug 'vimsence/vimsence' " Discord presence
  Plug 'wakatime/vim-wakatime' " Wakatime plugins
  Plug 'http://github.com/tpope/vim-surround' " Surrounding vim)
  Plug '~/local-plugin'
call plug#end()

" Enable gruvbox
"let g:lightline = {'colorscheme': 'gruvbox'}

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
  \ 'coc-go',
  \ '@yaegassy/coc-ansible'
  \ ]