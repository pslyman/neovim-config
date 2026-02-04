-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function mute_diff_delete()
  local fg = vim.g.diff_delete_fg or "#99d1ce"
  local bg = vim.g.diff_delete_bg or "#551d1c"
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = fg, bg = bg })

  local add_fg = vim.g.diff_add_fg or "#99d1ce"
  local add_bg = vim.g.diff_add_bg or "#1b5a4c"
  vim.api.nvim_set_hl(0, "DiffAdd", { fg = add_fg, bg = add_bg })
end

local diff_hl_group = vim.api.nvim_create_augroup("user_diff_hl", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = diff_hl_group,
  callback = mute_diff_delete,
})

mute_diff_delete()
