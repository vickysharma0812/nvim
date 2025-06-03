return {
  "stevearc/overseer.nvim",
  lazy = false,
  opts = function()
    return {
      templates = {
        "user.baseDev",
        "user.classesDev",
        "user.baseInstall",
        "user.classesInstall",
        "user.easifemLint",
        "user.run_script",
        -- "builtin",
      },
      component_aliases = {
        default = {
          "on_output_summarize",
          "on_exit_set_status",
          { "on_complete_notify",  statuses = { "FAILURE", "SUCCESS" }, on_change = true },
          { "on_complete_dispose", statuses = { "SUCCESS", "FAILURE" } },
          {
            "on_result_diagnostics",
            virtual_text = true,
            remove_on_restart = true,
            signs = true,
            underline = true,
          },
          { "on_result_diagnostics_quickfix", open = true },
        },
      },
    }
  end,
  keys ={
    { "<leader>oR", "<cmd>OverseerRestartLast<CR>", desc = "Overseer Restart last cmd", nowait = true, remap = false },
    { "<leader>od", "<cmd>OverseerClose<CR>", desc = "Overseer close", nowait = true, remap = false },
    { "<leader>oo", "<cmd>OverseerOpen<CR>", desc = "Overseer open", nowait = true, remap = false },
    { "<leader>oq", "<cmd>OverseerQuickAction<CR>", desc = "Overseer quick action", nowait = true, remap = false },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run", nowait = true, remap = false },
    { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle", nowait = true, remap = false },
    { "<leader>ow", "<cmd>WatchRun<CR>", desc = "Watch run", nowait = true, remap = false },
  },
}
