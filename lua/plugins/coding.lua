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
      excluded_ft = { "text", "markdown", "quarto" },
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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    -- event = "VeryLazy",
    -- You can make it lazy-loaded via VeryLazy,
    -- but comment out if thing doesn't work
    init = function()
      -- taken from here https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99
      -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      require("ufo").setup({
        -- your config goes here
        -- open_fold_hl_timeout = ...,
        -- provider_selector = function(bufnr, filetype)
        --  ...
        -- end,
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = {
      mappings = { -- Keys to be mapped to their corresponding default scrolling animation
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb",
      },
      hide_cursor = true,
      -- Hide cursor while scrolling
      stop_eof = true,
      -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false,
      -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true,
      -- The cursor will keep on scrolling even if the window cannot scroll further
      duration_multiplier = 1.0,
      -- Global duration multiplier
      easing = "linear",
      -- Default easing function
      pre_hook = nil,
      -- Function to run before the scrolling animation starts
      post_hook = nil,
      -- Function to run after the scrolling animation ends
      performance_mode = false,
      -- Disable "Performance Mode" on all buffers.
      ignored_events = {
        -- Events ignored while scrolling
        "WinScrolled",
        "CursorMoved",
      },
    },
  },
}
