return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = nil, -- We set up custom mappings in keymaps.lua
      hide_numbers = false, -- Show line numbers in terminal
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      -- Show terminal number in the winbar
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return "Terminal " .. term.id
        end,
      },
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    },
  },
}
