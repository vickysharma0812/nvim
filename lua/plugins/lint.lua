---@diagnostic disable: missing-fields
return {
  --
  -- better quickfix
  --
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufReadPost", "BufNewFile" },
    ft = "qf",
    config = function()
      require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
      })
    end,
  },

  --
  -- fortran linting
  --

  {
    "mfussenegger/nvim-lint",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
      local lint = require("lint")

      -- local errorformat =
      -- "%-Ggfortran%.%#,%A%f:%l:%c:,%A%f:%l:,%C,%C%p%*[0123456789^],%Z%trror:\\ %m,,%Z%tarning:\\ %m,%C%.%#,%-G%.%#"
      local errorformat =
        "%f:%l:%c: %tError: %m,%f:%l:%c: %tWarning: %m,%f:%l:%c: %tNote: %m,%A%f:%l:%c:,%Z%m,%C %#%m,%-G%.%#"
      -- pattern explanation:
      -- %A = Start of multi-line message
      -- %C = Continuation line
      -- %Z = End of multi-line message
      -- %-G = Ignore this line completely
      -- %f = Filename
      -- %l = Line number
      -- %c = Column number
      -- %t = Error type (E/W/N)
      -- %m = Error message
      -- %p = Pointer line (shows where error occurs with ^)

      lint.linters.gfortran = {
        name = "gfortran",
        cmd = "gfortran",
        ignore_exitcode = true, -- set this to true if you don't want to show error messages
        stream = "both", -- set this to "stdout" if the output is not an error, for example with luac
        parser = require("lint.parser").from_errorformat(errorformat),
        args = {
          "-c",
          "-fsyntax-only",
          "-cpp",
          -- "-fdiagnostics-plain-output",
          "-Wunused-variable",
          "-Wunused-dummy-argument",
          "-Wno-c-binding-type",
          "-Wall",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/lint/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/base/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/classes/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/tomlf/include/toml-f/modules/",
          -- os.getenv("HOME") .. "/.easifem/install/fftw/include/",
          -- os.getenv("HOME") .. "/.easifem/install/gmsh/include/",
          -- os.getenv("HOME") .. "/.easifem/install/lapack95/include/",
          -- os.getenv("HOME") .. "/.easifem/install/lis/include/",
          -- os.getenv("HOME") .. "/.easifem/install/sparsekit/include/",
          -- os.getenv("HOME") .. "/.easifem/install/superlu/include/",
          "-J",
          os.getenv("HOME") .. "/.easifem/easifem/lint/include/",
          "-DDEBUG_VER",
        }, -- args to pass to the linter
      }
      lint.linters_by_ft = {
        fortran = { "gfortran" },
      }
    end,
  },

  --
  -- markdown linting
  --
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- markdown = { "markdownlint" },
        markdown = { "markdownlint-cli2" },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = true,
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        transparent_bg = false, -- Set the background of the diagnostic to transparent
        transparent_cursorline = false, -- Set the background of the cursorline to transparent (only one the first diagnostic)

        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "CursorLine",
          mixing_color = "None",
        },

        options = {

          show_source = {
            enabled = false,
            if_many = true,
          },

          use_icons_from_diagnostic = true,

          softwrap = 30,

          multilines = {
            enabled = true,
            always_show = false,
          },

          overflow = {
            mode = "wrap",
            padding = 0, 
          },
          break_line = {
            enabled = false,
            after = 30,
          },
        },
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
