require('which-key').register({
  ['<leader>'] = {
    h = { '<cmd>set hlsearch!<cr>', 'Toggle highlight' },
    r = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'Reload config' },
    c = { '<Plug>(comment_toggle_linewise_current)<cr>', 'Comment current line' },
    q = { '<cmd>qa<cr>', 'Close all buffers and quit' },
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
            .buffers(require('telescope.themes').get_ivy())
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
      c = {
        function()
          require('telescope.builtin')
            .current_buffer_fuzzy_find(require('telescope.themes').get_ivy())
        end, 'Current buffer fuzzy find'
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
    name = '+options',
    c = { '<Plug>(comment_toggle_linewise_visual)<cr>', 'Comment current line' },
  },
}, { mode = 'v' })
