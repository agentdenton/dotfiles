noremap <space> <nop>
let mapleader = " "

syntax on
filetype plugin indent on

set exrc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set hlsearch
set noerrorbells
set noswapfile
set nobackup
set scrolloff=12
set hidden
set mouse=a
set encoding=utf-8
set nowrap
set noshowmode
set ruler
set laststatus=0
set noshowcmd
set background=dark
set shortmess+=c
set clipboard+=unnamedplus
set updatetime=300

nnoremap E $
nnoremap B ^

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vmap E $h
vmap B ^h
