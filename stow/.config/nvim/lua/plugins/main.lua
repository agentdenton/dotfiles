require("catppuccin").setup({
  no_italic = true,
  no_underline = true,
})

return {
  { "catppuccin/nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- add more treesitter parsers
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
      },
    },
  },

  {
    "mason.org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  { "nvim-lualine/lualine.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
}
