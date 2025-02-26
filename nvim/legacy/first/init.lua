require('settings')
require('mappings')
require('autocmds')
require('commands')

local g = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

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
  use 'wbthomason/packer.nvim'
  use 'catppuccin/nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'
  use 'nvim-tree/nvim-tree.lua'

  -- use {
  --   'folke/which-key.nvim',
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 100
  --   end
  -- }
  use {
    'nvim-treesitter/nvim-treesitter',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)

require('plugins/treesitter')
require('plugins/telescope')
require('plugins/nvim-tree')
require('plugins/ibl')
require('plugins/comment')
require('plugins/lualine')
require('plugins/theme')
