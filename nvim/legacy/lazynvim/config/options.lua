-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.completeopt = 'menuone,noinsert,noselect' -- better completion
vim.opt.ignorecase = true -- case insensitive search
-- opt.smartcase = true -- case sensitive when uppercase
vim.opt.undofile = false  -- enable undo file
vim.opt.swapfile = false  -- disable swap file
vim.opt.hidden = true -- don't save on buffer change
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scrolloff = 12
vim.opt.exrc = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.breakindent = true
-- vim.opt.showbreak = string.rep(">>>", 3)
vim.opt.linebreak = true
vim.opt.lazyredraw = true
vim.opt.list = true -- show empty spaces
vim.opt.ruler = true
vim.opt.laststatus = 2 -- enable status line
vim.opt.mouse = "a"
vim.opt.scl = "no"
vim.opt.clipboard = "unnamedplus"
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = '81'
vim.o.wildmode = "list:full" -- better <cmd> autocomplete
-- vim.opt.iskeyword:remove{'_'}
-- vim.o.guicursor = "n-v-c-i:block"

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

vim.diagnostic.enable(false)
