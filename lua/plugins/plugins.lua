return {
  -- Mason (using new repo names)
  { "mason-org/mason.nvim", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  -- Colorscheme
  {
    "whatyouhide/vim-gotham",
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
    -- Upstream's prebuilt macOS arm64 binary is a malformed Mach-O (Darwin errno
    -- 88, EBADMACHO) and cannot even be ad-hoc signed, so `:MarkdownPreview`
    -- failed with E903. Upstream is dead (last push 2024-07).
    -- mkdp#rpc#start_server does have a `node app/index.js` fallback, but it is
    -- gated on executable() of the prebuilt binary -- which only tests the +x
    -- bit, so the broken binary always won. Install the app deps and delete the
    -- binary instead of calling mkdp#util#install(), which re-downloads it.
    "iamcco/markdown-preview.nvim",
    build = function(plugin)
      local app = plugin.dir .. "/app"
      vim.fn.system({ "npx", "--yes", "yarn", "install", "--non-interactive", "--cwd", app })
      for _, bin in ipairs(vim.fn.glob(app .. "/bin/markdown-preview-*", false, true)) do
        vim.fn.delete(bin)
      end
    end,
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
