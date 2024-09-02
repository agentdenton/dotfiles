vim.diagnostic.enable(false)

require("catppuccin").setup({
  no_italic = true,
  no_underline = true,
})

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

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {},
      inlay_hints = { enabled = false },
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
