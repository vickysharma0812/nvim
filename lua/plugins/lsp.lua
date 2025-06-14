return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  cmd = { "LspInfo", "LspInstall", "LspRestart", "LspStart", "LspStop", "LspUninstall" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "cmakelang",
        "dprint",
        "fortls",
        "fprettify",
        "julials",
        "jupytext",
        "lua_ls",
        "markdownlint",
        "markdownlint-cli2",
        "marksman",
        "mdformat",
        "shfmt",
        "stylua",
        "taplo",
        "texlab",
        "tinymist",
      },
    })

    local lsp_flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 150,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

    vim.lsp.config("marksman", {
      capabilities = capabilities,
      filetypes = { "markdown", "quarto" },
      root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
    })
    vim.lsp.enable("marksman")

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            workspaceEvent = "None",
            disable = {
              "missing-fields",
              "trailing-space",
            },
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    vim.lsp.config("fortls", {
      capabilities = capabilities,
      flags = lsp_flags,
      -- cmd = require("plugins.args.fortran").lsp_cmd or {},
      cmd = {
        "fortls",
        "--lowercase_intrinsics",
        "--notify_init",
        "--source_dirs",
        os.getenv("dropbox") .. "/easifem/base/src/**",
        os.getenv("dropbox") .. "/easifem/classes/src/**",
        os.getenv("dropbox") .. "/easifem/elasticity/src/**",
        os.getenv("dropbox") .. "/easifem/acoustic/src/**",
        os.getenv("HOME") .. "/.easifem/src/tomlf/src/**",
        "--hover_signature",
        "--hover_language",
        "fortran",
        "--use_signature_help",
      },
    })
    vim.lsp.enable("fortls")

    vim.lsp.config("tinymst", {
      capabilities = capabilities,
      flags = lsp_flags,
      cmd = { "tinymist" },
      filetypes = { "typst" },

      -- following settings are taken from here
      -- https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/Configuration.md
      settings = {
        formatterMode = "typstyle", -- or "typstfmt"
        projectResolution = "singleFile", -- "lockDatabase"
        -- outputPath = 
        exportTarget = "paged", -- "html"
        exortPdf = "onSave",
      },
    })
    vim.lsp.enable("tinymst")

    vim.lsp.config("texlab", {
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        texlab = {
          bibtexFormatter = "latexindent",
          build = {
            args = {
              "-outdir=build",
              "-auxdir=build",
              "-pdf",
              "-interaction=nonstopmode",
              "-synctex=1",
              "%f",
            },
            executable = "latexmk",
            -- executable = "tectonic",
            -- args = {"-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates",
            -- "--outdir", "build"},
            forwardSearchAfter = true,
            onSave = false,
            auxDirectory = "build",
            logDirectory = "build",
            pdfDirectory = "build",
          },
          chktex = {
            onEdit = false,
            onOpenAndSave = true,
          },
          diagnosticsDelay = 300,
          formatterLineLength = 80,
          forwardSearch = {
            executable = "sioyek",
            args = {
              "--reuse-window",
              "--execute-command",
              "toggle_synctex",
              "--inverse-search",
              'texlab inverse-search -i "%%1" -l %%2',
              "--forward-search-file",
              "%f",
              "--forward-search-line",
              "%l",
              "%p",
            },
          },
          latexFormatter = "latexindent",
          latexindent = {
            modifyLineBreaks = true,
          },
        },
      },
    })
    vim.lsp.enable("texlab")
  end,
}
