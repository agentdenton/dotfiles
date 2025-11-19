-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank-ag", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local term_ag = vim.api.nvim_create_augroup("term-ag", { clear = true })
-- Enter insert mode when switching to terminal
vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "WinEnter" }, {
	desc = "Enter insert mode when switching to terminal",
	group = term_ag,
	pattern = "term://*",
	command = "startinsert",
})
-- Remove line numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Remove line numbers in terminal mode",
	group = term_ag,
	command = "setlocal listchars= nonumber norelativenumber",
})

local indent2_ag = vim.api.nvim_create_augroup("indent2-ag", { clear = true })
-- Set indentation to 2 spaces
vim.api.nvim_create_autocmd("Filetype", {
	desc = "Set indentation to 2 spaces",
	group = indent2_ag,
	pattern = { "lua", "cpp", "c" },
	command = "set softtabstop=2 shiftwidth=2 tabstop=2",
})
local indent4_ag = vim.api.nvim_create_augroup("indent4-ag", { clear = true })
-- Set indentation to 4 spaces
vim.api.nvim_create_autocmd("Filetype", {
	desc = "Set indentation to 4 spaces",
	group = indent4_ag,
	pattern = { "python", "rust", "sh" },
	command = "set softtabstop=4 shiftwidth=4 tabstop=4",
})

-- Remove whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove whitespace on save",
	pattern = "*.{not md}",
	group = vim.api.nvim_create_augroup("remove-whitespace-ag", { clear = true }),
	command = ":%s/\\s\\+$//e",
})
