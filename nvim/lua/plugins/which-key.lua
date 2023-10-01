require('which-key').register({
  ['<leader>'] = {
    f = {
      name = 'files',
      f = {
        function()
          require('telescope.builtin')
            .find_files(require('telescope.themes').get_ivy())
        end, 'Find files'
      },
      b = {
        function()
          require('telescope.builtin')
            .buffers(require('telescope.themes') .get_ivy())
        end, 'Search open buffers'
      },
    },
    g = {
      name = '+grep',
      g = {
        function()
          require('telescope.builtin')
            .live_grep(require('telescope.themes').get_ivy())
        end, 'Live grep'
      },
    },
    t = {
      name = '+nvim-tree',
      t = { '<cmd>NvimTreeToggle<cr>', 'Toggle Tree' },
      f = { '<cmd>NvimTreeFocus<cr>', 'Focus Tree' },
    },
    b = {
      name = '+buffers',
      c = { '<cmd>bdelete<cr>', 'Delete current buffer'},
      p = { '<cmd>edit #<cr>', 'Switch to the previous buffer' }
    },
    m = {
      name = '+movement',
      h = { '<c-h>', 'Move left'},
      j = { '<c-j>', 'Move down'},
      k = { '<c-k>', 'Move up'},
      l = { '<c-l>', 'Move right'},
    },
    ['<space>'] = {
      name = '+options',
      h = { '<cmd>set hlsearch!<cr>', 'Toggle highlight' },
      r = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'Reload config' },
      t = {
        name = '+terminal',
        h = { '<c-\\><c-n><c-w>h', 'Move terminal left'},
        j = { '<c-\\><c-n><c-w>j', 'Move terminal down'},
        k = { '<c-\\><c-n><c-w>k', 'Move terminal up'},
        l = { '<c-\\><c-n><c-w>l', 'Move terminal right'},
        n = { '<c-\\><c-n>', 'Switch to normal mode' }
      },
      c = { '<Plug>(comment_toggle_linewise_current)<cr>', 'Comment current line' },
    },
  },
}, { mode =  'n' })


require('which-key').register({
  ['<leader>'] = {
    ['<space>'] = {
      name = '+options',
      c = { '<Plug>(comment_toggle_linewise_visual)<cr>', 'Comment current line' },
    },
  },
}, { mode = 'v' })
