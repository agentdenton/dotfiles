local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local g = vim.g

g.mapleader = ' '

map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

map('n', '<C-n>', ':bnext<CR>', { noremap = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true })

map('n', 'E', '$', { noremap = true })
map('n', 'B', '^', { noremap = true })

map('n', 'Y', 'y$', { noremap = true })
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', 'J', 'mzJ`z', { noremap = true })

map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })
map('v', 'E', '$h',    { noremap = true })
map('v', 'B', '^h',    { noremap = true })

map('i', '"', '""<left>', { noremap = true })
map('i', "'", "''<left>", { noremap = true })
map('i', '(', '()<left>', { noremap = true })
map('i', '[', '[]<left>', { noremap = true })

map('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true })
map('n', '<Leader>t', ':term<CR>', { noremap = true })
