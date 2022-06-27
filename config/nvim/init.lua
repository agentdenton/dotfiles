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

require('packer').startup(function()
  use "arcticicestudio/nord-vim"
  use 'folke/tokyonight.nvim'
  use 'tpope/vim-commentary'

  use "ibhagwan/fzf-lua"
  use "lukas-reineke/indent-blankline.nvim"
  use 'wbthomason/packer.nvim'

  use 'nvim-lualine/lualine.nvim'
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

require('lualine').setup({
  options = {
    theme = require('lline_theme').theme(),
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {''},
    lualine_x = {''},
    lualine_y = {'filename'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_c = {'filename'},
    lualine_x = {'location'},
  },
})

require('indent_blankline').setup()

cmd [[colorscheme nord]]
