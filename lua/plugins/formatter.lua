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
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          toml = { "taplo" },
          typst = { "typstyle", "typstfmt", stop_after_first = true },
          fortran = { "fprettify", stop_after_first = true },
          go = { "goimports" },
          tex = { "latexindent" },
          markdown = {"markdownlint-cli2", "injected" },
          cmake = { "gersemi", "cmake_format" },
          json = { "jq", "dprint", stop_after_first = true },
          julia = { lsp_format = "fallback" },
          quarto = { "markdownlint-cli2", "injected" },
          kdl = { "kdlfmt" },
        },
        formatters = {
          injected = {
            options = {
              ignore_errors = false,
              lang_to_ext = {
                bash = "sh",
                julia = "jl",
                latex = "tex",
                markdown = "md",
                python = "py",
                rust = "rs",
                lua = "lua",
              },
              lang_to_formatters = {},
            },
          },
          fprettify = {
            append_args = {
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
              "--case",
              "2",
              "2",
              "2",
              "2",
            },
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
