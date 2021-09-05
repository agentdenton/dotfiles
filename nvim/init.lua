require('settings')
require('mappings')
require('plugins')
require('doom-one')

local cmd = vim.cmd

-- override some colors
cmd [[hi CursorLine guibg=#333644]]
cmd [[hi LineNr guifg=#404455]]
cmd [[hi CursorLineNr guibg=#282c34 guifg=#46d9ff]]
