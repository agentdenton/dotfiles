require('plugins')
require('keys')

local opt = vim.opt
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
opt.showmode = true
opt.showcmd = true
opt.cmdheight = 1
opt.incsearch = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.hidden = true
opt.equalalways = false
opt.cursorline = true
opt.splitright = true
opt.hlsearch = true
opt.scrolloff = 20
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true
opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1
opt.belloff = "all"
opt.clipboard = "unnamedplus"
opt.inccommand = "split"
opt.swapfile = false
opt.termguicolors = true
opt.mouse = "a"

vim.cmd('colorscheme nord')
vim.cmd("let g:lightline = { 'colorscheme': 'nord' } ")
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
