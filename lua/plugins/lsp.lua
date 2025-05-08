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

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("pengvim-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          local function vmap(keys, func, desc)
            vim.keymap.set("v", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gh", vim.lsp.buf.signature_help, "[g]o to signature [h]elp")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          vmap("<leader>Lf", vim.lsp.buf.format, "[l]sp [f]ormat")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, "LSP client not found")

          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("pengvim-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("pengvim-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "pengvim-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "[T]oggle Inlay [H]ints")
          end
        end,
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
