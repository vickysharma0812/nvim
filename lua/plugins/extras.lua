return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({})
    end,
    keys = {
      {
        "<leader>uH",
        "<cmd>ColorizerToggle<CR>",
        desc = "Colorizer Toggle",
      },
    },
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "dag/vim-fish",
    ft = { "fish" },
  },
  {
    "hat0uma/csvview.nvim",
    ft = "csv",
    config = function()
      require("csvview").setup({
        view = {
          --- @type integer
          min_column_width = 5,

          --- @type integer
          spacing = 2,

          ---@type "highlight" | "border"
          display_mode = "border",
        },
      })
    end,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
    config = function()
      vim.g.typst_pdf_viewer = "zathura"
    end,
  },
}
