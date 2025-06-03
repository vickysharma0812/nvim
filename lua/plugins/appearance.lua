return {
  -- Provides Nerd Font 1 icons (glyphs)
  -- for use by Neovim plugins:Provides Nerd Font 1 icons
  -- (glyphs) for use by Neovim plugins:
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        override_by_filename = {
          ["toml"] = {
            icon = "",
            color = "#6d8086",
            name = "Toml",
          },
        },
      })
    end,
  },

  -- A small Neovim plugin to improve the deletion of buffers.
  {
    "ojroques/nvim-bufdel",
  },

  -- Highly experimental plugin that completely replaces the UI for messages,
  -- cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
}
