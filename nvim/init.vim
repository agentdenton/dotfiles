syntax on
set exrc
set tabstop=8
set shiftwidth=4
set expandtab
set smartindent
set hlsearch
set noerrorbells
set noswapfile
set nobackup
set scrolloff=12
set showcmd
set hidden
set mouse=a
set encoding=utf-8
set cursorline
set nowrap
set linebreak
set ruler
set incsearch
set laststatus=2
set relativenumber
set number
set cursorline
set background=dark
set shortmess+=c
set clipboard+=unnamedplus
set list
set completeopt=menuone,noinsert,noselect
set updatetime=300
set t_Co=256
set termguicolors
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:rustfmt_autosave = 1
let g:indentLine_char = '|'

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5 } }
let g:fzf_layout = { 'down': '40%' }

noremap <space> <nop>
let mapleader = "\<Space>"

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
vmap     E $h
vmap     B ^h

nnoremap <leader>r <cmd>:noh<cr>
nnoremap <leader>t <cmd>term<cr>
nnoremap <leader>c <cmd>bd<cr>
nnoremap <leader>f <cmd>Files<cr>
nnoremap <leader>g <cmd>Rg<cr>
nnoremap <leader>b <cmd>Buffers<cr>
nnoremap <leader>m <cmd>Marks<cr>
nnoremap <leader>l <cmd>BLines<cr>
nnoremap <leader>h <cmd>History:<cr>
nnoremap <leader>p :e#<cr>
nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

colorscheme nord
let g:lightline = { 'colorscheme': 'nord'}

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
