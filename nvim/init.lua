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
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        "projekt0n/circles.nvim",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
end)

require'nvim-tree'.setup()

require('colorizer').setup()

require("circles").setup({
    icons = {
        empty = "",
        filled = "",
        lsp_prefix = ""
    },
    lsp = true
})

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

require('lualine').setup({
    options = {
        theme  = 'github',
        icons_enabled = true,
        component_separators = { ' ', ' ' },
        section_separators = { ' ', ' ' },
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

require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.5,
                height = 0.5
            }
        }
    },
    pickers = {
        find_files = {
            previewer = false,
        },
        git_files = {
            previewer = false,
        }
    },
})

require("github-theme").setup({
    theme_style = "dark",
    transparent = false,
    hide_inactive_statusline = false,
    function_style = "NONE",
    keyword_style = "NONE",
})
