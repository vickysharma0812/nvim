return {
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
      require("mini.bracketed").setup()
      require("mini.pairs").setup()
      require("mini.icons").setup()
      require("mini.tabline").setup()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      })
      require("mini.files").setup({})
    end,
    keys = {
      {
        "<leader>e",
        function(...)
          if not MiniFiles.close() then
            MiniFiles.open(...)
          end
        end,
        desc = "File explorer using mini",
      },
    },
  },
}
