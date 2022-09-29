colors_red = "#f38ba8"

vim.g.catppuccin_flavour = "frappe"
require("catppuccin").setup({
  transparent_background = false,
  term_colors = false,
  compile = {
    enabled = false,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  highlight_overrides = {
    frappe = {
      WinSeparator = {fg = "#414559"}, -- white
      -- TSKeyword = {fg = "#f38ba8"}, -- red
      -- TSConditional = {fg = colors_red}, -- red
      -- TSBoolean = {fg = colors_red}, -- red
      -- TSType = {fg = colors_red}, -- red
    },
  },
})
vim.cmd [[colorscheme catppuccin]]
