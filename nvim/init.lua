require('settings')
require('mappings')
require('plugins')

require("github-theme").setup({
    theme_style = "dark",
    transparent = false,
    function_style = "NONE",
    keyword_style = "NONE",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    colors = {hint = "orange", error = "#ff0000"}
})
