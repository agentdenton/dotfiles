local api = vim.api
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt

o.completeopt = "menuone,noselect" -- better completion

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive when uppercase
opt.undofile = true  -- enable undo file
opt.swapfile = false  -- disable swap file
opt.hidden = true -- don't save on buffer change
opt.shortmess = opt.shortmess + 'c'
opt.splitright = true
opt.splitbelow = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.cursorline = true
opt.scrolloff = 12
opt.exrc = true
opt.smartindent = true
opt.showcmd = true
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(">>>", 3)
opt.linebreak = true
opt.list = true -- show empty spaces
opt.ruler = true
opt.laststatus = 0
opt.showmode = false
opt.mouse = "a"
opt.scl = "no"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.background = 'dark'
-- opt.number = true
-- opt.relativenumber = true

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

cmd [[let g:indentLine_char = '|']]

-- disable new line comments
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
