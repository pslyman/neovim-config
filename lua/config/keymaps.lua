-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal toggle function that respects count prefix
local function toggle_term()
  local count = vim.v.count1
  vim.cmd(count .. "ToggleTerm")
end

-- Note to self, this is aggressive. Learn the default mapping (\ instead of /) if this is an issue.
-- Ctrl+/ mappings (terminals may send as C-/ or C-_)
vim.keymap.set("n", "<C-/>", toggle_term, { desc = "Toggle terminal" })
vim.keymap.set("n", "<C-_>", toggle_term, { desc = "Toggle terminal" })
vim.keymap.set("i", "<C-/>", toggle_term, { desc = "Toggle terminal" })
vim.keymap.set("i", "<C-_>", toggle_term, { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-/>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-_>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Diffview (side-by-side git diffs)
local function diffview_cmd(cmd)
  pcall(vim.cmd, cmd)
end

vim.keymap.set("n", "<leader>gd", function()
  local ok, lib = pcall(require, "diffview.lib")
  if ok and lib.get_current_view() then
    diffview_cmd("DiffviewClose")
  else
    diffview_cmd("DiffviewOpen")
  end
end, { desc = "Git diff (Diffview)" })

vim.keymap.set("n", "<leader>gD", function()
  local ok, lib = pcall(require, "diffview.lib")
  if ok and lib.get_current_view() then
    diffview_cmd("DiffviewClose")
  else
    diffview_cmd("DiffviewOpen --cached")
  end
end, { desc = "Git diff staged (Diffview)" })

vim.keymap.set("n", "<leader>gq", function()
  diffview_cmd("DiffviewClose")
end, { desc = "Diffview close" })
