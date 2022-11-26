local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = ' '

-- autoclosing backets
map('i', '{<CR>', '{<CR><BS>}<Esc>O', {noremap = true})

-- move faster between splits
map('n', '<c-h>', '<c-w>h', {noremap = true})
map('n', '<c-j>', '<c-w>j', {noremap = true})
map('n', '<c-k>', '<c-w>k', {noremap = true})
map('n', '<c-l>', '<c-w>l', {noremap = true})

-- faster normal mode in terminal
map('t', '<c-space>', '<c-\\><c-n>', {noremap = true})

-- move between terminal windows
map('t', '<c-h>', '<c-\\><c-n><c-w>h', {noremap = true})
map('t', '<c-j>', '<c-\\><c-n><c-w>j', {noremap = true})
map('t', '<c-k>', '<c-\\><c-n><c-w>k', {noremap = true})
map('t', '<c-l>', '<c-\\><c-n><c-w>l', {noremap = true})

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

-- disable annoying man pages
map('n', 'K', '<nop>', {noremap = true})

-- switch between buffers
map('n', '<c-p>', ':edit #<CR>', {noremap = true})

-- close the buffer
map('n', '<c-c>', ':bdelete<CR>', {noremap = true})

-- close all buffers except current one
map('n', '<c-c>a', ':%bd|e#<CR>', {noremap = true})

-- create a terminal in a split below
map('n', '<leader>t', ':split | term<CR>', {noremap = true})

-- remove highlight from words
map('n', '<leader><space>', ':set hlsearch!<CR>', {noremap = true})

-- telescope mappings
map('n', '<leader>f', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>g', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>b', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>gc', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true})

-- lsp mappings
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {noremap = true})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {noremap = true})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {noremap = true})
