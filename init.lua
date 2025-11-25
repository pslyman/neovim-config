-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- In your init.lua or init.vim
vim.opt.updatetime = 100 -- Faster file change detection
vim.opt.autoread = true -- Auto-reload files changed outside Neovim

-- Set up auto-reload autocmd
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

