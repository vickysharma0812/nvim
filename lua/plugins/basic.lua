return {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = [[
     ███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗
     ██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║
     █████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║
     ██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║
     ███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║
     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝
    EASIFEM
    Expandable And Scalable Infrastructure for Finite Element Methods
    (c) Vikas Sharma, 2023
    https://www.easifem.com
            ]],
        },
      },
      statuscolumn = {
        enabled = false,
      },
      keys = {
        {
          action = ":FzfLua files",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        {
          action = ":ene | startinsert",
          desc = " New File",
          icon = " ",
          key = "n",
        },
        {
          action = ":FzfLua oldfiles",
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = ":FzfLua live_grep",
          desc = " Find Text",
          icon = " ",
          key = "g",
        },
        {
          action = ':lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },
        {
          action = ":Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = ":qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signs = false,
    },
  },
  {
    "echasnovski/mini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup({
        mappings = {
          add = "gsa",
          delete = "gsd",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          replace = "gsr",
          update_n_lines = "gsn",
        },
      })
      require("mini.icons").setup()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      })
    end,
  },
  {
    "sustech-data/wildfire.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup()
    end,
  },
}
