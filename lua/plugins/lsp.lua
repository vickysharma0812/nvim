return 
  {
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
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "shfmt",
          "cmakelang",
          "julials",
          "fortls",
          "fprettify",
          "jupytext",
          "taplo",
          "lua_ls",
          "texlab",
          "mdformat",
          "marksman",
          "markdownlint-cli2",
          "markdownlint",
          "dprint",
          "markdown-oxide",
        },
      })


      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

      lspconfig.marksman.setup({
        capabilities = capabilities,
        filetypes = { "markdown", "quarto" },
        root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
      })

      require("lspconfig").markdown_oxide.setup({
        -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
        -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
      })

      lspconfig.lua_ls.setup({
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

      lspconfig.fortls.setup({
        capabilities = capabilities,
        flags = lsp_flags,
        cmd = require("plugins.args.fortran").lsp_cmd or {},
      })

      lspconfig.texlab.setup({
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
          inlayHints = {
            labelReferences = false,
            labelDefinitions = false,
          },
        },
      })

    end,
  }
