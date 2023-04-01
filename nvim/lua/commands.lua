function set_indent_mode(width, use_tabs)
  vim.opt.tabstop = width
  vim.opt.shiftwidth = width
  vim.opt.softtabstop = width
  if use_tabs then
    vim.opt.expandtab = false
  else
    vim.opt.expandtab = true
  end
end
vim.api.nvim_create_user_command(
  'KernIndent', ':lua set_indent_mode(8, true)',
  {}
)
vim.api.nvim_create_user_command(
  'StdIndent', ':lua set_indent_mode(4, false)',
  {}
)
