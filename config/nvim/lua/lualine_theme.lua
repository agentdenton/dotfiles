local colors = {
	rosewater = "#F2D5CF",
	flamingo = "#EEBEBE",
	pink = "#F4B8E4",
	mauve = "#CA9EE6",
	red = "#E78284",
	maroon = "#EA999C",
	peach = "#EF9F76",
	yellow = "#E5C890",
	green = "#A6D189",
	teal = "#81C8BE",
	sky = "#99D1DB",
	sapphire = "#85C1DC",
	blue = "#8CAAEE",
	lavender = "#BABBF1",

	text = "#C6D0F5",
	subtext1 = "#B5BFE2",
	subtext0 = "#A5ADCE",
	overlay2 = "#949CBB",
	overlay1 = "#838BA7",
	overlay0 = "#737994",
	surface2 = "#626880",
	surface1 = "#51576D",
	surface0 = "#414559",

	base = "#303446",
	mantle = "#292C3C",
	crust = "#232634",
}

local custom_frappe = {
  normal = {
    a = {bg = colors.blue, fg = colors.mantle, gui = "bold"},
    b = {bg = colors.surface0, fg = colors.blue},
    c = {bg = colors.surface0, fg = colors.text},
  },
  insert = {
    a = {bg = colors.green, fg = colors.base, gui = "bold"},
    b = {bg = colors.surface1, fg = colors.teal},
  },
  command = {
    a = {bg = colors.peach, fg = colors.base, gui = "bold"},
    b = {bg = colors.surface1, fg = colors.peach},
  },
  visual = {
    a = {bg = colors.mauve, fg = colors.base, gui = "bold"},
    b = {bg = colors.surface1, fg = colors.mauve},
  },
  replace = {
    a = {bg = colors.red, fg = colors.base, gui = "bold"},
    b = {bg = colors.surface1, fg = colors.red},
  },
  inactive = {
    a = {bg = colors.mantle, fg = colors.blue},
    b = {bg = colors.mantle, fg = colors.surface1, gui = "bold"},
    c = {bg = colors.surface0, fg = colors.overlay0},
  },
}

local lualine = require('lualine')
lualine.setup({
  options = {
    theme = custom_frappe,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'diff' },
  },
  tabline = {},
  extensions = {},
})
