return {
  name = "easifemRunTest",
  builder = function(params)
    local file = vim.fn.expand("%:p")
    return {
      -- strategy = {
      --   "toggleterm",
      --   use_shell = false,
      --   open_on_start = false,
      --   hidden = true,
      -- },
      cmd = { "easifem" },
      args = { "run", file, "--rebuild" },
      name = "easifemRunTest",
      cwd = vim.fn.expand("%:h"), -- "/tmp",
      env = {},
      components = {
        {
          "open_output",
          direction = "float",
          focus = false,
          on_result = "always",
        },
        "default",
      },
      condition = {
        filetype = { "fortran" },
      },
    }
  end,
  desc = "[Dev tool for easifem] run a test",
  params = {},
  priority = 50,
  condition = {
    filetype = { "fortran" },
  },
}
