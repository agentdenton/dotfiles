local api = vim.api
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt

g.markdown_folding = 1

o.completeopt = "menuone,noselect" -- better completion

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive when uppercase
opt.undofile = true  -- enable undo file
opt.swapfile = false  -- disable swap file
opt.hidden = true -- don't save on buffer change
opt.showmode = false
opt.shortmess = opt.shortmess + 'c'
opt.splitright = true
opt.splitbelow = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 12
opt.exrc = true
opt.smartindent = true
opt.showcmd = true
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(">>>", 3)
opt.linebreak = true
opt.linebreak = true
opt.laststatus = 2
opt.list = true -- show empty spaces
opt.mouse = "a"
opt.scl = "yes"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.background = 'dark'

-- highlight on yank
api.nvim_exec(
[[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]],
    false
)

-- disable line numbers in terminal
api.nvim_exec(
[[
    augroup neovim_terminal
        autocmd!
        autocmd TermOpen * startinsert
        autocmd TermOpen * :set nonumber norelativenumber
        autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
    augroup END
]],
    false
)

cmd [[let g:rustfmt_autosave = 1]]
cmd [[let g:indentLine_char = '|']]

-- disable new line comments
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove all spaces and lines at the end of the file on save
cmd [[au BufWritePre * %s/\s\+$//e]]
cmd [[au BufWritePre * %s/\n\+\%$//e]]

-- markdown folding
cmd [[ au FileType markdown setlocal foldlevel=99 ]]

-- UNUSED

-- remove all spaces and lines at the end of the file on save
-- cmd [[au BufWritePre * %s/\s\+$//e]]
-- cmd [[au BufWritePre * %s/\n\+\%$//e]]
