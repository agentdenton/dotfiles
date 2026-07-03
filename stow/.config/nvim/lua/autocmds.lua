-- Highlight when yanking (copying) text
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
