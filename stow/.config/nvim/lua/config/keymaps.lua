vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

vim.keymap.set("n", "ge", "$", { noremap = true })
vim.keymap.set("n", "gb", "^", { noremap = true })

vim.keymap.set("v", "ge", "$h", { noremap = true })
vim.keymap.set("v", "gb", "^h", { noremap = true })

vim.keymap.set("n", "U", "<cmd>redo<cr>", { desc = "Redo" })
