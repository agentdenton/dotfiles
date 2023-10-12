vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

map('n', '<space>', '<nop>', {noremap = true})
map('v', '<space>', '<nop>', {noremap = true})

-- disable annoying man pages
map('n', 'K', '<nop>', {noremap = true})

-- switch to normal mode in terminal
map('t', '<c-space>', '<c-\\><c-n>', {noremap = true})

map('n', 'ge', '$', {noremap = true})
map('n', 'gb', '^', {noremap = true})

map('n', 'Y', 'y$', {noremap = true})
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})
map('n', 'J', 'mzJ`z', {noremap = true})

map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})
map('v', 'ge', '$h',    {noremap = true})
map('v', 'gb', '^h',    {noremap = true})

map('n', 'U', '<cmd>redo<cr>', {noremap = true})
