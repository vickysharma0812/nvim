return {
  --- Code Companion
  --- A Neovim plugin that provides AI-powered code assistance, including chat,
  --- inline suggestions, and command-line interactions.
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      strategies = {
        chat = {
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
            },
            close = {
              modes = { n = "<C-x>", i = "<C-x>" },
            },
          },
          roles = {
            llm = function(adapter)
              return " " .. adapter.formatted_name
            end,
            user = "  EASIFEM",
          },
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
      },
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.7-sonnet",
                },
              },
            })
          end,
        },
      },
      display = {
        chat = {
          auto_scroll = true,
          show_header_separator = true,
        },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            save_chat_keymap = "sc",
            auto_save = false,
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        ":CodeCompanionChat Toggle<CR>",
        mode = { "n", "v" },
        silent = true,
      },
    },
  },
}
