
vim.cmd("call plug#begin('~/.config/nvim/plugged')")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'JuliaEditorSupport/julia-vim'")
vim.cmd("Plug 'rust-lang/rust.vim'")
vim.cmd("Plug 'Yggdroot/indentLine'")
vim.cmd("Plug 'chriskempson/base16-vim'")
vim.cmd("Plug 'nvim-lua/popup.nvim'")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")
vim.cmd("call plug#end()")
vim.cmd("colorscheme base16-material-darker")

vim.g.mapleader = " "
vim.g.rustfmt_autosave = true
vim.g.indentLine_char = "|"

vim.o.exrc = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smd = true
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.scrolloff=12
vim.o.showcmd = true
vim.o.hidden = true
vim.o.mouse = 'a' 
vim.o.encoding = 'utf-8'
vim.o.cursorline = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.ruler = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.background = 'dark'
vim.o.shortmess = 'c'
vim.o.list = true
-- vim.o.signcolumn = "yes"
vim.o.completeopt='menuone,noinsert,noselect'
vim.o.updatetime = 300
vim.o.colorcolumn = '80'
vim.o.t_Co = '256'
vim.o.termguicolors = true
vim.o.syntax = 'on'

local options = {
    noremap = true
}

vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>noh<cr>', options)

-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--   },
-- }
-- local nvim_lsp = require'lspconfig'
-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

-- nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )

