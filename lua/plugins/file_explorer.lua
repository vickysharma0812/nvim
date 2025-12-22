return {
  {
    "stevearc/oil.nvim",
    enabled = false,
    opts = {},
    dependencies = {
      "echasnovski/mini.icons",
    },
    lazy = false,
    keys = {
      {
        "<leader>O",
        ":Oil<CR>",
        desc = "Open Oil",
      },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    keys = {
      {
        "<leader>fo",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<leader>fe",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
