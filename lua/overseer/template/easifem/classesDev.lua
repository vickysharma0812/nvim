return {
  -- Required fields
  name = "classesDev",
  builder = function(params)
    return {
      cmd = { "easifem" },
      -- args = { "dev", "classes", "-q", "--env", "dev" },
      args = { "dev", "classes", "-q" },
      name = "devClasses",
      cwd = vim.fn.expand("%:h"), -- "/tmp",
      env = {},
      components = {
        "default",
        -- open output window;
        -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#open_output
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
        -- restart on save:
        -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#restart_on_save
        {
          "restart_on_save",
          delay = 500,
        },
        -- { "run_after" }
        { "unique", replace = false, restart_interrupts = true },
        {
          "run_after",
          task_names = { "classesInstall" },
          detach = false,
          statuses = { "SUCCESS" },
        },
      },
      condition = {
        filetype = { "fortran" },
      },
    }
  end,
  desc = "[Dev tool for libeasifemClasses] build easifem's classes lib in debug mode",
  params = {},
  priority = 50,
  condition = {
    filetype = { "fortran" },
  },
}
