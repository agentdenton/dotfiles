local g = vim.g
g.mapleader = " "

local key_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        {noremap = true, silent = true}
    )
end

key_mapper('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key_mapper('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
key_mapper('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
key_mapper('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
