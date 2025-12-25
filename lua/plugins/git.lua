return {
  {
    "tpope/vim-fugitive",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "folke/snacks.nvim", -- optional
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit", nowait = true, remap = false },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = " " },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
    keys = {
      -- { "<leader>gD", "<cmd>lua require 'gitsigns'.diffthis('~')<cr>", desc = "Diff", nowait = true, remap = false },
      { "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", nowait = true, remap = false },
      { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer", nowait = true, remap = false },
      { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer", nowait = true, remap = false },
      -- { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff", nowait = true, remap = false },
      { "<leader>gI", "<cmd>Gitsigns<cr>", desc = "Init Gitsigns" },
      { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk", nowait = true, remap = false },
      { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk", nowait = true, remap = false },
      { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame", nowait = true, remap = false },
      {
        "<leader>gp",
        "<cmd>Gitsigns preview_hunk_inline<cr>",
        desc = "Preview Hunk Inline",
        nowait = true,
        remap = false,
      },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk", nowait = true, remap = false },
      { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk", nowait = true, remap = false },
      { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view open" },
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diff view open" },
      { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Diff view close" },
    },
  },
}
