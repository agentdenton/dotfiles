local g = vim.g
local cmd = vim.cmd

g.catppuccin_flavour = "frappe"
require("catppuccin").setup({
  transparent_background = false,
})

cmd [[colorscheme catppuccin]]
cmd [[hi WinSeparator guifg=#949cbb]]
