return {

  ---
  -- Copilot
  --
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    enabled = true,
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<C-CR>", --"<C-CR>"
            refresh = "gr",
            open = "<M-o>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-CR>", --"<M-CR>"
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<M-x>",
          },
        },
        filetypes = {
          fortran = true,
          go = true,
          markdown = true,
          quarto = true,
          gitcommit = true,
          yaml = false,
          help = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
    keys = {
      {
        "<leader>ue",
        "lua require('copilot.suggestion').toggle_auto_trigger()",
        desc = "Toggle copilot auto suggestion",
        nowait = true,
        remap = false,
      },
    },
  },
}
