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
map('n', '<C-c>', ':bd<CR>', { noremap = true })

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

map('n', '<leader><space>', ':set hlsearch!<CR>', { noremap = true })
map('n', '<leader>t', ':term<CR>', { noremap = true })

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

map('n', '<leader>gc', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { noremap = true })

map('n', '<leader>h', '<cmd>Telescope command_history<cr>', { noremap = true })
map('n', '<leader>m', '<cmd>Telescope marks<cr>', { noremap = true })

-- Nvim Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { noremap = true })

-- UNUSED

-- map('i', '"', '""<left>', { noremap = true })
-- map('i', "'", "''<left>", { noremap = true })
-- map('i', '(', '()<left>', { noremap = true })
-- map('i', '[', '[]<left>', { noremap = true })

-- Telescope
-- map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { noremap = true })
-- map('n', '<leader>h', '<cmd>Telescope help_tags<cr>', { noremap = true })
-- map('n', '<leader>g', '<cmd>Telescope git_branches<cr>', { noremap = true })
-- map('n', '<leader>ft', '<cmd>Telescope file_browser<cr>', { noremap = true })
