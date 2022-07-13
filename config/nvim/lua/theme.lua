local g = vim.g
local cmd = vim.cmd
g.catppuccin_flavour = "frappe"

local catppuccin = require("catppuccin")
local colors = require'catppuccin.api.colors'.get_colors()
catppuccin.remap({
  WinSeparator = {fg = colors.overlay2},
  IncSearch = {fg = colors.base, bg = colors.text},
  Search = {fg = colors.base, bg = colors.text},
})

cmd [[colorscheme catppuccin]]
