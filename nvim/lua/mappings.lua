local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = ' '

map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

map('n', '<C-n>', ':bnext<CR>', { noremap = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true })

map('n', 'E', '$', { noremap = true })
map('n', 'B', '^', { noremap = true })
map('v', 'E', '$h',    { noremap = true })
map('v', 'B', '^h',    { noremap = true })

map('n', 'Y', 'y$', { noremap = true })
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', 'J', 'mzJ`z', { noremap = true })

map('n', '<Leader>w', ':up<CR>', { noremap = true })
map('n', '<Leader>q', ':wq<CR>', { noremap = true })
map('n', '<Leader>qq', ':q!<CR>', { noremap = true })

map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })
map('v', '<C-c>', '"+y',    { noremap = true })

map('i', '<C-v>', '<C-r>+', { noremap = true })
map('i', '"', '""<left>', { noremap = true })
map('i', "'", "''<left>", { noremap = true })
map('i', '(', '()<left>', { noremap = true })
map('i', '[', '[]<left>', { noremap = true })

map('i', '.', '.<C-g>', { noremap = false })
map('i', ',', ',<C-g>', { noremap = false })
map('i', '!', '!<C-g>', { noremap = false })

cmd [[inoremap {<cr> {<cr>}<esc>O]]
map('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true })
map('n', '<Leader>t', ':term<CR>', { noremap = true })

-- fzf
map('n', '<Leader>f', '<cmd>Files<CR>', { noremap = true })
map('n', '<Leader>g', '<cmd>Rg<CR>', { noremap = true })
map('n', '<Leader>b', '<cmd>Buffers<CR>', { noremap = true })
map('n', '<Leader>m', '<cmd>Marks<CR>', { noremap = true })
map('n', '<Leader>h', '<cmd>History<CR>', { noremap = true })

-- nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
