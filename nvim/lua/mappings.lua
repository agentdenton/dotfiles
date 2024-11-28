vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- disable annoying man pages
map('n', 'K', '<nop>', {noremap = true})

-- Prevent the leader key from moving move the cursor when no command is
-- selected in which-key
map('n', '<leader>', '<nop>', {noremap = true})
map('n', '<leader><space>', '<nop>', {noremap = true})
map(
  'n',
  '<leader>h',
  '<cmd>set hlsearch!<cr>',
  {noremap = true, desc = 'Toggle highlight'}
)
map(
  'n',
  '<leader>r',
  '<cmd>luafile ~/.config/nvim/init.lua<cr>',
  {noremap = true, desc = 'Reload config'}
)

map("n", "<leader>\"", 'ciw""<Esc>P', {noremap = true})
map("n", "<leader>'", 'ciw""<Esc>P', {noremap = true})

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

map('n', '<c-q>', '<cmd>qa<cr>', {noremap = true})

map('n', 'gc', '<Plug>(comment_toggle_linewise_current)<cr>', {noremap = true})

map(
  'n',
  '<leader>f',
  '<cmd>lua require("telescope.builtin").find_files({layout_strategy="bottom_pane"})<cr>',
  { desc = 'Telescope find files' }
)
map(
  'n',
  '<leader>g',
  '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="bottom_pane"})<cr>',
  { desc = 'Telescope live grep' }
)
map(
  'n',
  '<leader>b',
  '<cmd>lua require("telescope.builtin").buffers({layout_strategy="bottom_pane"})<cr>',
  { desc = 'Telescope buffers' }
)

map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle Tree' })
map('n', '<leader>tf', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus Tree' })
