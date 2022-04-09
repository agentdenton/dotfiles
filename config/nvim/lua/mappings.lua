local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

g.mapleader = ' '

-- disable annoying man pages
map('n', 'K', '<nop>', {noremap = true})

map('n', '<c-h>', '<c-w>h', {noremap = true})
map('n', '<c-j>', '<c-w>j', {noremap = true})
map('n', '<c-k>', '<c-w>k', {noremap = true})
map('n', '<c-l>', '<c-w>l', {noremap = true})

map('n', '<c-n>', ':bnext<CR>', {noremap = true})
map('n', '<c-p>', ':bprev<CR>', {noremap = true})
map('n', '<c-c>', ':bd<CR>', {noremap = true})

map('n', 'E', '$', {noremap = true})
map('n', 'B', '^', {noremap = true})

map('n', 'Y', 'y$', {noremap = true})
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})
map('n', 'J', 'mzJ`z', {noremap = true})

map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})
map('v', 'E', '$h',    {noremap = true})
map('v', 'B', '^h',    {noremap = true})

map('n', '<c-w>', ':w<CR>', {noremap = true})
map('n', '<c-q>', ':q<CR>', {noremap = true})

map('n', '<leader><space>', ':set hlsearch!<CR>', {noremap = true})
map('n', '<leader>t', ':term<CR>', {noremap = true})

-- fzf
map('n', '<leader>f', ":lua require('fzf-lua').files()<CR>", {noremap = true})
map('n', '<leader>g', ":lua require('fzf-lua').grep()<CR>", {noremap = true})
map('n', '<leader>gc', ":lua require('fzf-lua').grep_curbuf()<CR>", {noremap = true})
map('n', '<leader>ch', ":lua require('fzf-lua').command_history()<CR>", {noremap = true})
