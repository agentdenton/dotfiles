local cmd = vim.cmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- enable italics in tmux
cmd [[ set t_ZH=^[[3m] ]]
cmd [[ set t_ZR=^[[23m ]]

-- highlight on yank
augroup('YankHighlight', {clear = true})
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = '100'})
  end
})

-- remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- set indentation to 4 spaces
augroup('setIndent', {clear = true})
autocmd('Filetype', {
  group = 'setIndent',
  pattern = {'python', 'rust'},
  command = 'set softtabstop=4 shiftwidth=4 tabstop=4'
})

-- remove line numbers in terminal mode
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber',
})

-- Enter insert mode when switching to terminal
autocmd({'TermOpen', 'BufWinEnter', 'WinEnter'}, {
  pattern = 'term://*',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})
