return {
  {
    "dhruvasagar/vim-table-mode",
    keys = {
      { "<leader>ut", ":TableModeEnable<CR>", desc = "[t]able Mode Enable" },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,
    opts = {
      preview = {
        icon_provider = "devicons", -- "internal", "mini" or "devicons"
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { blink = { enabled = true } },
    },
    keys = {
      {
        "<leader>um",
        function()
          require("render-markdown").toggle()
        end,
        desc = "[m]arkdown render toggle",
      },
      -- {
      --   "<leader>uM",
      --   function()
      --     require("render-markdown").toggle(true)
      --   end,
      --   desc = "[M]arkdown render toggle force",
      -- },
    },
  },
}
