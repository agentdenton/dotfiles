require('settings')
require('mappings')

local api = vim.api
local fn = vim.fn
local cmd = vim.md
local g = vim.g
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary'
    use 'Yggdroot/indentLine'
    use "projekt0n/github-nvim-theme"
    use 'hoob3rt/lualine.nvim'
    use 'norcalli/nvim-colorizer.lua'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
end)

require('colorizer').setup()

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'c',
        'bash',
        'lua',
        'python',
        'rust',
        'julia',
    },
})

local custom_github = require'lualine.themes.github'
custom_github.normal.c.bg = '#24292e'
custom_github.visual.c.bg = '#24292e'
custom_github.replace.c.bg = '#24292e'
custom_github.insert.c.bg = '#24292e'
custom_github.inactive.c.bg = '#24292e'
custom_github.command.c.bg = '#24292e'

require('lualine').setup({
    options = {
        theme  = custom_github,
        icons_enabled = true,
        theme = 'github',
        component_separators = { ' ', ' ' },
        section_separators = { '', '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = {
                    hint = '  ',
                },
                sections = { 'error', 'warn', 'info', 'hint' },
            },
            'progress',
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' }
    }
})

require("github-theme").setup({
    theme_style = "dark",
    transparent = false,
    function_style = "NONE",
    keyword_style = "NONE",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    colors = {hint = "orange", error = "#ff0000"}
})
