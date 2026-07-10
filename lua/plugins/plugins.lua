return {
  -- Mason (using new repo names)
  { "mason-org/mason.nvim", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  -- Colorscheme
  {
    "whatyouhide/vim-gotham",
    -- Pin: latest commit d3dbb47 references undefined palette key `deepblue`
    -- (colors/gotham.vim:279 `s:Col('Float','cyan','deepblue')`) -> E716 on load,
    -- so LazyVim falls back to habamax. 747ee82 is the last good commit.
    -- Remove this pin once upstream fixes the missing `deepblue` color.
    commit = "747ee82960b4a7ed75ac133bb84bfc02b5ac9e27",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gotham",
    },
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = "",
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "dlyongemallo/diffview-plus.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keymaps = {
        view = {
          { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
        },
        file_panel = {
          { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
        },
        file_history_panel = {
          { "n", "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
        },
      },
    },
  },
}
