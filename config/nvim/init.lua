require('settings')
require('mappings')

local g = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.md
local execute = vim.api.nvim_command
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
    use 'tpope/vim-commentary'

    use "lukas-reineke/indent-blankline.nvim"
    use 'navarasu/onedark.nvim'
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
end)

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

require('onedark').setup({
    style = 'darker',
    transparent = true,

    code_style = {
        comments = 'italic',
        keywords = 'none', 
        functions = 'none', 
        strings = 'none',
        variables = 'none'
    },

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
})
require('onedark').load()

require("indent_blankline").setup()
