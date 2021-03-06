local opt = vim.opt

opt.completeopt = 'menuone,noinsert,noselect' -- better completion

opt.ignorecase = true -- case insensitive search
-- opt.smartcase = true -- case sensitive when uppercase
opt.undofile = true  -- enable undo file
opt.swapfile = false  -- disable swap file
opt.hidden = true -- don't save on buffer change
opt.shortmess = opt.shortmess + 'c'
opt.splitright = true
opt.splitbelow = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.cursorline = true
opt.scrolloff = 12
opt.exrc = true
opt.smartindent = true
opt.showcmd = true
opt.showmode = false
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(">>>", 3)
opt.linebreak = true
opt.lazyredraw = true
opt.list = true -- show empty spaces
opt.ruler = true
opt.laststatus = 3 -- enable status line
opt.mouse = "a"
opt.scl = "no"
opt.clipboard = "unnamedplus"
opt.updatetime = 1000
opt.timeoutlen = 500
opt.termguicolors = true
opt.background = 'dark'
opt.number = true
opt.relativenumber = true
