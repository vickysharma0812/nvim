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
        filter = {
          fzf = {
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
          },
        },
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

      local errorformat =
        "%-Ggfortran%.%#,%A%f:%l:%c:,%A%f:%l:,%C,%C%p%*[0123456789^],%Z%trror:\\ %m,,%Z%tarning:\\ %m,%C%.%#,%-G%.%#"

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
          os.getenv("HOME") .. "/.easifem/lint/include/",
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
    config = function()
      require("tiny-inline-diagnostic").setup({
        signs = {
          left = "",
          right = "",
          diag = "●",
          arrow = "    ",
          up_arrow = "    ",
          vertical = " │",
          vertical_end = " └",
        },
        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "CursorLine",
          mixing_color = "None",
        },
        blend = {
          factor = 0.27,
        },
        options = {
          softwrap = 15,
          overflow = {
            mode = "wrap",
          },
          break_line = {
            enabled = false,
            after = 30,
          },
        },
      })
    end,
  },
}
