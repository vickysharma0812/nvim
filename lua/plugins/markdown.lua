return {
  {
    "jbyuki/nabla.nvim",
    lazy = true,
    keys = function()
      return {
        {
          "<leader>m",
          ':lua require("nabla").popup()<cr>',
          desc = "NablaPopUp",
        },
      }
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    keys = {
      { "<leader>ut", ":TableModeEnable<CR>", desc = "[t]able Mode Enable" },
    },
  },
}
