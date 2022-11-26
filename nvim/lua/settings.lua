vim.opt.completeopt = 'menuone,noinsert,noselect' -- better completion
vim.opt.ignorecase = true -- case insensitive search
-- opt.smartcase = true -- case sensitive when uppercase
vim.opt.undofile = true  -- enable undo file
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
vim.opt.wrap = false
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
vim.opt.updatetime = 1000
vim.opt.timeoutlen = 500
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true
