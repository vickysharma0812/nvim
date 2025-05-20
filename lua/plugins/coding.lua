return {
  {
    "ecthelionvi/NeoColumn.nvim",
    lazy = false,
    ft = { "fortran", "lua" },
    opts = {
      fg_color = "#ea9d34",
      bg_color = "#ea9d34",
      NeoColumn = "78",
      always_on = true,
      excluded_ft = { "text", "markdown" },
    },
    keys = {

      {
        "<leader>tc",
        "<cmd>ToggleNeoColumn<CR>",
        desc = "toggle column higlight",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      keywords = {
        PUBLIC = { icon = " ", color = "info" },
        INTERNAL = { icon = " ", color = "error" },
        SET = { icon = " ", color = "warning" },
        GET = { icon = " ", color = "test" },
        CONSTRUCTOR = { icon = "󰮮 ", color = "hint" },
        IO = { icon = "󰠿 ", color = "info" },
        SUBCLASS = { icon = "󰑣 ", color = "error" },
      },
    },
  },
  {
    "smoka7/multicursors.nvim",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        "<C-d>",
        "<cmd>MCstart<cr>",
        desc = "Multi cursor starts",
        mode = { "n", "v" },
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp", "treesitter", "regex" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "bbjornstad/pretty-fold.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("pretty-fold").setup({
        sections = {
          left = {
            "content",
          },
          right = {
            " ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ",
            function(config)
              return config.fill_char:rep(3)
            end,
          },
        },
        fill_char = "•",
        remove_fold_markers = true,
        keep_indentation = true,
        -- Possible values:
        -- "delete" : Delete all comment signs from the fold string.
        -- "spaces" : Replace all comment signs with equal number of spaces.
        -- false    : Do nothing with comment signs.
        process_comment_signs = "spaces",
        comment_signs = {},
        add_close_pattern = true, -- true, 'last_line' or false
        matchup_patterns = {
          { "{", "}" },
          { "%(", ")" },
          { "%[", "]" },
        },
        ft_ignore = { "neorg", "TelescopeResults", "ToggleTerm", "Noice", "sagaoutline", "dashboard" },
      })
      require("pretty-fold").ft_setup("lua", {
        matchup_patterns = {
          { "^%s*if", "end" },
          { "^%s*for", "end" },
          { "function%s*%(", "end" },
          { "{", "}" },
          { "%(", ")" },
          { "%[", "]" },
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          vim.cmd("ccl")
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          vim.cmd("ccl")
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({
        filter = {
          fzf = {
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
          },
        },
      })
    end,
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {
      pattern = "*",
      insert_mode = true,
      floating = false,
      disabled_filetypes = {},
      disabled_modes = {},
    },
    config = function(opts)
      require("scrollEOF").setup(opts)
    end,
  },
  {
    "chrisbra/NrrwRgn",
    lazy = true,
    keys = {
      {
        "<leader>nr",
        "<plug>NrrwrgnDo<cr>",
        desc = "NrrwRgn",
        mode = { "n", "v" },
      },
    },
  },
  {
    "tzachar/highlight-undo.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("highlight-undo").setup({
        duration = 300,
        undo = {
          hlgroup = "HighlightUndo",
          mode = "n",
          lhs = "u",
          map = "undo",
          opts = {},
        },
        redo = {
          hlgroup = "HighlightRedo",
          mode = "n",
          lhs = "<C-r>",
          map = "redo",
          opts = {},
        },
        highlight_for_count = true,
      })
    end,
  },
  {
    "jaimecgomezz/here.term",
    keys = {
      {
        "<M-t>",
        function()
          require("here-term").toggle_terminal()
        end,
        mode = { "n", "i", "t" },
        desc = "Toggle Terminal Here",
      },
      {
        "<M-S-t>",
        function()
          require("here-term").kill_terminal()
        end,
        mode = { "n", "i", "t" },
        desc = "Kill Terminal Here",
      },
    },
  },

  {
    "andymass/vim-matchup",
    enabled = false,
    lazy = false,
    config = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
      }
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        preview_float = {
          mode = "diagnostics",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
