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
    use 'tpope/vim-commentary'
    use 'Yggdroot/indentLine'

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
