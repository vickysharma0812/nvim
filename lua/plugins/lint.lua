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

      -- this errorformat works well
      -- local errorformat =
      --   "%-Ggfortran%.%#,%A%f:%l:%c:,%A%f:%l:,%C,%C%p%*[0123456789^],%Z%trror:\\ %m,,%Z%tarning:\\ %m,%C%.%#,%-G%.%#"
     
      -- this error format also works well, it is corrected by AI from the previous one
      local errorformat = "%-Ggfortran%.%#," -- Ignore lines starting with gfortran
        .. "%A%f:%l:%c:," -- Start of multi-line message with column
        .. "%A%f:%l:," -- Start of multi-line message without column
        .. "%C," -- Empty continuation line
        .. "%C%p%*[0123456789^]," -- Continuation line with pointer (^)
        .. "%Z%trror:\\ %m," -- End of error message
        .. "%Z%tarning:\\ %m," -- End of warning message
        .. "%Z%tote:\\ %m," -- Add support for notes
        .. "%C%.%#," -- Any other continuation line
        .. "%-G%.%#" -- Ignore everything else

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
          "-fdiagnostics-show-caret",
          "-fdiagnostics-color=never",
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
      vim.diagnostic.config({ virtual_text = false })

      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        transparent_bg = false, -- Set the background of the diagnostic to transparent
        transparent_cursorline = false, -- Set the background of the cursorline to transparent (only one the first diagnostic)

        hi = {
          error = "DiagnosticError", -- Highlight group for error messages
          warn = "DiagnosticWarn", -- Highlight group for warning messages
          info = "DiagnosticInfo", -- Highlight group for informational messages
          hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
          arrow = "NonText", -- Highlight group for diagnostic arrows

          -- Background color for diagnostics
          -- Can be a highlight group or a hexadecimal color (#RRGGBB)
          background = "CursorLine",

          -- Color blending option for the diagnostic background
          -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
          mixing_color = "None",
        },

        options = {

          show_source = {
            enabled = false,
            if_many = false,
          },

          use_icons_from_diagnostic = false,

          softwrap = 30,

          multilines = {
            enabled = true,
            always_show = true,
          },

          overflow = {
            mode = "wrap",
            padding = 0,
          },

          break_line = {
            enabled = false,
            after = 30,
          },
          virt_texts = {
            -- Priority for virtual text display
            priority = 4056,
          },
        },
      })
    end,
  },
}
