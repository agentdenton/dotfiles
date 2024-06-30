require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'yaml',
    'json',
    'bash',
    'lua',
    'python',
    'rust',
    'julia',
    'just',
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
})
