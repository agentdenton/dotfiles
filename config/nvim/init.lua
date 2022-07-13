require('settings')
require('mappings')
require('autocmds')

local g = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

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

local disable_plugins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

-- disable unused default plugins
for _, plugin in pairs(disable_plugins) do
  g["loaded_" .. plugin] = 1
end


local packer = require('packer')
packer.startup(function()
  -- use 'bhagwan/fzf-lua'

  use 'wbthomason/packer.nvim'
  use 'catppuccin/nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'c',
    'yaml',
    'bash',
    'lua',
    'python',
    'rust',
    'julia',
  },
})

local indent_blankline = require('indent_blankline')
indent_blankline.setup()

local telescope = require('telescope')

require('lualine_theme')
require('theme')
