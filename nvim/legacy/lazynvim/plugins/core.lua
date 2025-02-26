require("catppuccin").setup({
	no_italic = true,
	no_underline = true,
})

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

return {
	{ "catppuccin/nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-frappe",
		},
	},

	{ "folke/trouble.nvim", enabled = false },
	{ "rcarriga/nvim-notify", enabled = false },
	{ "akinsho/bufferline.nvim", enabled = false },

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
        rust_analyzer = {
          mason = false,
          cmd = { vim.fn.expand("~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
          settings = {
            ["rust-analyzer"] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      },
			inlay_hints = { enabled = false },
			autoformat = false,
		},
		settings = {
			Lua = {
				diagnostics = false,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"cpp",
				"c",
				"rust",
			},
		},
	},

	-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
	-- would overwrite `ensure_installed` with the new value.
	-- If you'd rather extend the default config, use the code below instead:
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"tsx",
				"typescript",
			})
		end,
	},
}
