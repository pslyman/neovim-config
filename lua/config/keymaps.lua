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
