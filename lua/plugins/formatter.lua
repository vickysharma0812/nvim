return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      {
        "<leader>cf",
        function()
          require("conform").format({})
        end,
        mode = { "n", "v" },
        desc = "Format Current buffer",
      },
    },
    opts = function()
      local opts = {
        -- LazyVim will use these options when formatting with the conform.nvim formatter
        default_format_opts = {
          timeout_ms = 5000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback",
        },

        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          toml = { "taplo" },
          typst = { "typstyle" },
          fortran = { "fprettify", "myfmt", stop_after_first = true },
          tex = { "latexindent" },
          markdown = { "markdownlint-cli2"},
          -- markdown = { "markdownlint-cli2", "dprint" },
          cmake = { "cmake_format" },
          json = { "jq" },
          julia = { lsp_format = "fallback" },
          quarto = { "injected" },
        },
        format_on_save = {
          -- I recommend these options. See :help conform.format for details.
          lsp_format = "fallback",
          timeout_ms = 500,
        },
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = {
            options = {
              ignore_errors = false,
              -- Map of treesitter language to file extension
              -- A temporary file name with this extension will be generated during formatting
              lang_to_ext = {
                bash = "sh",
                julia = "jl",
                latex = "tex",
                markdown = "md",
                fortran = "F90",
                python = "py",
                rust = "rs",
                lua = "lua",
              },
              lang_to_formatters = {
                julia = { lsp_format = "fallback" },
              },
            },
          },
          fprettify = {
            args = {
              "--case",
              "2",
              "2",
              "2",
              "2",
              "--line-length",
              "78",
              "--indent",
              "2",
              "--strict-indent",
              "--disable-indent-mod",
              "--whitespace",
              "2",
              "--whitespace-comma",
              "--whitespace-assignment",
              "--enable-decl",
              "--whitespace-decl",
              "--whitespace-relational",
              "--whitespace-logical",
              "--whitespace-multdiv",
              "--whitespace-print",
              "--whitespace-intrinsics",
              "--strip-comments",
            },
            condition = function()
              return not vim.g.use_myfmt
            end,
          },
          myfmt = {
            command = "fprettify",
            args = {
              "--line-length",
              "78",
              "--indent",
              "2",
              "--strict-indent",
              "--disable-indent-mod",
              "--whitespace",
              "2",
              "--whitespace-comma",
              "--whitespace-assignment",
              "--enable-decl",
              "--whitespace-decl",
              "--whitespace-relational",
              "--whitespace-logical",
              "--whitespace-multdiv",
              "--whitespace-print",
              "--whitespace-intrinsics",
              "--strip-comments",
            },
            condition = function()
              return vim.g.use_myfmt
            end,
          },
          taplo = {
            args = {
              "format",
              "--option",
              "array_auto_collapse=false",
              "-",
            },
          },
          typstyle = {
            command = "typstyle",
            stdin = true,
            -- args = { "--column", "50" },
          },
          latexindent = {
            command = "latexindent",
            stdin = true,
            args = { "-" },
          },
          cmake_format = {
            command = "cmake-format",
            args = { "-" },
          },
          stylua = {
            command = "stylua",
            args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" },
          },
        },
      }
      return opts
    end,
  },
}
