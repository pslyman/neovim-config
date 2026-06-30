-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "fzf"

-- Prefer side-by-side diffs
if not vim.tbl_contains(vim.opt.diffopt:get(), "vertical") then
  vim.opt.diffopt:append("vertical")
end
