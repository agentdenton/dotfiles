require("options")
require("keymaps")
require("autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	opts = {},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{ -- Useful plugin to show you pending keybinds.
		'folke/which-key.nvim',
		event = 'VimEnter',
		opts = {
			delay = 0,
			icons = { mappings = false },
			spec = {
				{ '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
			},
		},
	},

	{ -- Fuzzy Finder (files, grep, etc)
		'nvim-telescope/telescope.nvim',
		enabled = true,
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function() return vim.fn.executable 'make' == 1 end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
		},
		config = function()
			require('telescope').setup {
				extensions = {
					['ui-select'] = { require('telescope.themes').get_dropdown() },
				},
			}

			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')

			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
			vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		end,
	},

	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
				no_italic = true,
				float = {
					transparent = true,
					solid = false,
				},
				integrations = {
					gitsigns = true,
					treesitter = false,
					mini = {
						enabled = true,
					},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{ -- Autoformat
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>f',
				function() require('conform').format { async = true, lsp_fallback = false } end,
				mode = '',
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = false,
			},
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
		},
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup()
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
			require("mini.pairs").setup()
			require("mini.comment").setup({
				mappings = {
					-- Disable operator-pending motion to prevent conflict with line comment
					comment = "",
					comment_line = "<leader>c",
					comment_visual = "<leader>c",
					textobject = "<leader>co",
				},
			})
			require("mini.bracketed").setup()
			require("mini.align").setup()
		end,
	},

}, { ui = { icons = {} } })
