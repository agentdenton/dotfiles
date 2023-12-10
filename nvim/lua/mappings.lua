vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

map('n', '<space>', '<nop>', {noremap = true})
map('v', '<space>', '<nop>', {noremap = true})

-- disable annoying man pages
map('n', 'K', '<nop>', {noremap = true})


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

map('n', '<c-h>', '<c-w>h', {noremap = true, desc = 'Goto left pane'})
map('n', '<c-j>', '<c-w>j', {noremap = true, desc = 'Goto pane below'})
map('n', '<c-k>', '<c-w>k', {noremap = true, desc = 'Goto pane up'})
map('n', '<c-l>', '<c-w>l', {noremap = true, desc = 'Goto right pane'})

-- switch to normal mode in terminal
map('t', '<c-space>', '<c-\\><c-n>', {noremap = true})

map('t', '<c-h>', '<c-\\><c-n><c-w>h', {noremap = true, desc = 'Move terminal left'})
map('t', '<c-j>', '<c-\\><c-n><c-w>j', {noremap = true, desc = 'Move terminal down'})
map('t', '<c-k>', '<c-\\><c-n><c-w>k', {noremap = true, desc = 'Move terminal up'})
map('t', '<c-l>', '<c-\\><c-n><c-w>l', {noremap = true, desc = 'Move terminal right'})
