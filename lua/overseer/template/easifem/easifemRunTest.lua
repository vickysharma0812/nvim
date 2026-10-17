---@diagnostic disable: undefined-global
return {
  name = "easifem run test",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "easifem" },
      args = { "run", file, "--rebuild", "-q" },
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
