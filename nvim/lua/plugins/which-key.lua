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
    s = {
      name = '+search',
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
    g = {
      name = '+goto',
      h = { '<c-w>h', 'Goto left pane'},
      j = { '<c-w>j', 'Goto pane below'},
      k = { '<c-w>k', 'Goto pane up'},
      l = { '<c-w>l', 'Goto right pane'},
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
    l = {
      name = '+lsp',
      g = {
        name = '+goto',
        d = {
          function()
            vim.lsp.buf.declaration()
          end,
          'Go to function definition'
        },
        D = {
          function()
            vim.lsp.buf.definition()
          end,
          'Go to function declaration'
        },
      },
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
