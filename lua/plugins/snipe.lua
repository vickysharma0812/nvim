return {
  {
    "leath-dub/snipe.nvim",
    opts = {
      ui = {
        position = "center",
        open_win_override = {
          title = "EASIFEM",
          border = "rounded",
        },

        text_align = "file-first",
      },
      hints = {
        dictionary = "asfghl;wertyuiop",
      },
      navigate = {
        close_buffer = "d",
        cancel_snipe = "q", --"<esc>",
      },
    },
    keys = {
      {
        "<leader>,",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
  },
}
