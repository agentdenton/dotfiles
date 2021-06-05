source ~/.config/nvim/plugins.vim
source ~/.config/nvim/basic.vim

let g:rustfmt_autosave = 1

let g:indentLine_char = '|'

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5 } }
let g:fzf_layout = { 'down': '40%' }

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 0
let g:tokyonight_italic_keywords = 0
let g:tokyonight_italic_variables = 0
let g:tokyonight_sidebars = [ "quickfix", "__vista__", "terminal" ]

let g:two_firewatch_italics=1

let ayucolor="light"

colorscheme nord

noremap <space> <nop>
let mapleader = "\<Space>"

nnoremap E $
nnoremap B ^
vmap     E $
vmap     B ^

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

" hi CursorLineNR guifg=yellow guibg=NONE
" hi LineNr guifg=NONE guibg=NONE
" hi Normal guibg=NONE ctermbg=NONE
" hi Comment guifg=#7e7e7e
" hi CursorLine ctermbg=NONE guibg=NONE
" hi StatusLine guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" hi StatusLineNC guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE
hi VertSplit cterm=NONE guibg=NONE

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
