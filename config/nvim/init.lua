require('settings')
require('mappings')

local g = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt

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

require("indent_blankline").setup()

require('packer').startup(function()
    use 'tpope/vim-commentary'
    use 'junegunn/fzf.vim'

    use "lukas-reineke/indent-blankline.nvim"
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use "projekt0n/github-nvim-theme"
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

require("github-theme").setup({
    theme_style = "dark",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
})
