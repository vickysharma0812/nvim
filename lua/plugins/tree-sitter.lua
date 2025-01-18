return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      autopairs = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
        "yaml",
        "toml",
        "julia",
        "fortran",
        "fish",
        "csv",
        "diff",
      },
      auto_install = true,
      indent = {
        enable = true,
        disable = { "yaml", "fortran" },
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
            ["]b"] = "@block.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
            ["]B"] = "@block.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
            ["[b"] = "@block.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
            ["[B"] = "@block.outer",
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.outer",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ao"] = "@block.outer",
            ["io"] = "@block.inner",
            -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  {
    "aaronik/treewalker.nvim",
    opts = {
      highlight = true,
    },
    keys = {
      {
        "<leader>tj",
        "<cmd>Treewalker Down<CR>",
        mode = { "n" },
        desc = "TreeWalker Down",
      },
      {
        "<leader>tk",
        "<cmd>Treewalker Up<CR>",
        mode = { "n" },
        desc = "TreeWalker Up",
      },
      {
        "<leader>th",
        "<cmd>Treewalker Left<CR>",
        mode = { "n" },
        desc = "TreeWalker Left",
      },
      {
        "<leader>tl",
        "<cmd>Treewalker Right<CR>",
        mode = { "n" },
        desc = "TreeWalker Right",
      },
    },
  },
}
