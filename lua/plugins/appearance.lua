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

  -- Similar to indent-blankline, this plugin can highlight the indent line,
  -- and highlight the code chunk according to the current cursor position.
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "─",
          },
          style = {
            "#00ffff",
            "#c21f30",
          },
          exclude_filetypes = {
            toml = true,
          },
        },
        indent = {
          enable = false,
        },
        line_num = {
          enable = true,
          style = "#b30eec",
          use_treesitter = true,
          exclude_filetypes = {
            toml = true,
          },
        },
      })
    end,
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

  -- Automatically expand width of the current window;
  -- Maximizes and restores the current window.
  {
    "anuvyklack/windows.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup({
        ignore = {
          buftype = { "quickfix", "terminal" },
          filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
        },
        animation = {
          enable = false,
        },
      })
    end,
    keys = {
      {
        "<leader>wt",
        "<cmd>WindowsToggleAutowidth<CR>",
        desc = "Toggle Autowidth",
      },
      {
        "<C-w>z",
        "<cmd>WindowsMaximize<CR>",
        desc = "WindowsMaximize",
      },
      {
        "<C-w>=",
        "<cmd>WindowsEqualize<CR>",
        desc = "WindowsEqualize",
      },
      {
        "<C-w>_",
        "<cmd>WindowsMaximizeVertically<CR>",
        desc = "WindowsMaximizeVertically",
      },
      {
        "<C-w>|",
        "<cmd>WindowsMaximizeHorizontally<CR>",
        desc = "WindowsMaximizeHorizontally",
      },
    },
  },
}
