require('github-theme').setup()
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
opt.showmode = false
opt.shortmess = opt.shortmess + 'c'
opt.splitbelow = true
opt.splitright = true
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
opt.wrap = false
opt.linebreak = true
opt.laststatus = 2
opt.mouse = "a"
opt.scl = "yes"
opt.clipboard = "unnamedplus"

opt.termguicolors = true
opt.background = 'dark'

-- g.tokyonight_style = "storm"
-- g.tokyonight_italic_keywords = false
-- g.tokyonight_italic_functions = false
-- g.tokyonight_colors = { comment = "yellow" }

cmd [[colorscheme github]]

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

cmd [[let g:rustfmt_autosave = 1]]
cmd [[let g:indentLine_char = '|']]

cmd [[let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5 } }]]
cmd [[let g:fzf_layout = { 'down': '40%' }]]

-- disable new line comments
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove all spaces and lines at the end of the file on save
cmd [[au BufWritePre * %s/\s\+$//e]]
cmd [[au BufWritePre * %s/\n\+\%$//e]]
