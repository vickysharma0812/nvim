return {
  "stevearc/overseer.nvim",
  lazy = false,
  opts = function()
    return {
      templates = {
        "easifem.baseDev",
        "easifem.classesDev",
        "easifem.easifemLint",
        "easifem.run_script",
        -- "builtin",
      },
      component_aliases = {
        default = {
          --
          -- open output window;
          --
          {
            "open_output",
            direction = "float",
            focus = false,
            on_complete = "never",
            on_result = "never",
            on_start = "never",
          },
          { "on_output_summarize", max_lines = 4 },
          {
            "on_output_quickfix",
            close = true,
            open = false,
            set_diagnostics = true,
            tail = true,
          },
          { "on_output_parse", problem_matcher = "$gcc" },
          --
          -- on_complete settings
          --
          {
            "on_complete_notify",
            statuses = { "FAILURE", "SUCCESS" },
            on_change = false,
          },
          -- see docs on on_result_notify
          {
            "on_complete_dispose",
            statuses = { "SUCCESS", "FAILURE", "CANCELED" },
            timeout = 30,
          },
          --
          -- on_result settings
          --
          {
            "on_result_diagnostics",
            virtual_text = true,
            remove_on_restart = true,
            signs = true,
            underline = true,
          },
          {
            "on_result_diagnostics_quickfix",
            open = false,
            close = true,
            set_empty_results = false,
          },
          {
            "on_result_diagnostics_trouble",
            -- args = {focus=true},
            close = true,
          },
          { "on_exit_set_status", success_codes = { 0 } },
          {
            "restart_on_save",
            delay = 500,
          },
          { "unique", replace = false, restart_interrupts = true },
        },
      },
    }
  end,
  keys = {
    { "<leader>oR", "<cmd>OverseerRestartLast<CR>", desc = "Overseer Restart last cmd", nowait = true, remap = false },
    { "<leader>od", "<cmd>OverseerClose<CR>", desc = "Overseer close", nowait = true, remap = false },
    { "<leader>oo", "<cmd>OverseerOpen<CR>", desc = "Overseer open", nowait = true, remap = false },
    { "<leader>oq", "<cmd>OverseerQuickAction<CR>", desc = "Overseer quick action", nowait = true, remap = false },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run", nowait = true, remap = false },
    { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle", nowait = true, remap = false },
    { "<leader>ow", "<cmd>WatchRun<CR>", desc = "Watch run", nowait = true, remap = false },
  },
}
