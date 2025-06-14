return {
  -- Required fields
  name = "baseDev",
  builder = function()
    return {
      cmd = { "easifem" },
      -- args = { "dev", "base", "-q", "--env", "dev" },
      args = { "dev", "base", "-q" },
      name = "devBase",
      cwd = vim.fn.expand("%:h"), -- "/tmp",
      env = {},
      components = {
        "default",
        { "on_complete_notify", statuses = { "FAILURE" }, on_change = true },
        { "on_complete_dispose", statuses = { "SUCCESS", "FAILURE", "CANCELED" }, timeout = 30 },
        { "on_output_quickfix", open = true, set_diagnostics = true },
        { "on_result_diagnostics", virtual_text = true },
        { "on_exit_set_status", success_codes = { 0 } },
        { "on_output_parse", problem_matcher = "$gcc" },
        { "restart_on_save" },
      },
      condition = {
        filetype = { "fortran" },
      },
    }
  end,
  desc = "[Dev tool for libeasifemBase] build easifem's base lib in debug mode",
  params = {},
  priority = 50,
  condition = {
    filetype = { "fortran" },
    callback = function(search)
      -- print(vim.inspect(search))
      return true
    end,
  },
}
