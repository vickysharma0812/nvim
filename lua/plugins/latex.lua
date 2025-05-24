return {
  {
    "lervag/vimtex",
    lazy = false,
    ft = { "tex", "bib", "latex" },
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          local wk = require("which-key")
          wk.add({
            { "<leader>v", group = "VIMTEX" },
            { "<leader>vb", "<cmd>VimtexCompile<CR>", desc = "BUILD" },
            { "<leader>vc", "<cmd>VimtexCountWords!<CR>", desc = "COUNT" },
            { "<leader>vd", "<cmd>VimtexClean<CR>", desc = "DELETE aux" },
            {
              "<leader>ve",
              function()
                local out_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY")
                if type(out_dir) == "string" then
                  local do_exist, _ = os.rename(out_dir, out_dir)
                  if do_exist == true then
                    vim.cmd("! bibexport -o %:r.bib ./" .. out_dir .. "/%:r.aux")
                    return
                  end
                end
                vim.cmd("! bibexport -o %:r.bib %:r.aux")
              end,
              desc = "MAKE bib file",
            },
            {
              "<leader>vf",
              function()
                vim.cmd("normal! w") -- before format, make sure that the file is latest
                if not vim.bo.filetype == "tex" then
                  vim.notify("Only default save was done (no format)", 3, { title = "This is not TeX file" })
                end
                local out_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY")
                if type(out_dir) == "string" then
                  local do_exist, _ = os.rename(out_dir, out_dir)
                  if do_exist then
                    -- NOTE: -c option determine the location of indent.log file
                    -- -o specifies the outputfile without backup
                    -- if you want the backup file use -w or -ww option
                    vim.cmd("! latexindent -c " .. out_dir .. " -s -o % %")
                    return
                  end
                end
                vim.cmd("! latexindent -s -o % %")
              end,
              desc = "FORMAT SAVE (no backup)",
            },
            { "<leader>vl", "<cmd>VimtexErrors<CR>", desc = "Error Log" },
            { "<leader>vm", "<plug>(vimtex-context-menu)", desc = "Vimtex menu" },
            { "<leader>vr", "<plug>(vimtex-doc-package)", desc = "Read VimTex Doc" },
            { "<leader>vv", "<cmd>VimtexView<CR>", desc = "View PDF" },
            { "<leader>vt", "<cmd>VimtexTocToggle<CR>", desc = "Toggle Table of Contents" },
          })
          vim.wo.conceallevel = 2
        end,
      })
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_context_pdf_viewer = "skim"
      vim.g.vimtex_quickfix_mode = 0

      vim.g.vimtex_log_ignore = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }

      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_bib = {
        simple = 1,
      }
      -- " VimTeX uses latexmk as the default compiler backend. If you use it, which is
      -- " strongly recommended, you probably don't need to configure anything. If you
      -- " want another compiler backend, you can change it as follows. The list of
      -- " supported backends and further explanation is provided in the documentation,
      -- " see ":help vimtex-compiler".
      -- vim.g.vimtex_compiler_method = "latexmk"

      -- vim.g.vimtex_compiler_latexmk = {
      --   aux_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY") or "build",
      --   out_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY") or "build",
      --   callback = 1,
      --   continuous = 1,
      --   executable = "latexmk",
      --   -- hooks = {},
      --   options = {
      --     "-xelatex",
      --     "-verbose",
      --     "-file-line-error",
      --     "-synctex=1",
      --     "-interaction=nonstopmode",
      --   },
      -- }
      --
      --
      -- Ignore mappings
      -- vim.g["vimtex_mappings_enabled"] = 0
      -- Fold
      -- NOTE: I prefer to vim-tex-fold now
      -- vim.g.vimtex_fold_enabled = 1
      -- vim.g.vimtex_fold_types = {
      --   preamble = { enabled = 1 },
      --   sections = { sections = { "chapter", "section" } },
      --   envs = { whitelist = { "table" } },
      --   comments = { enabled = 1 },
      -- }
      -- Auto format
      -- vim.g.vimtex_format_enabled = 1
      -- Auto Indent
      -- vim.g["vimtex_indent_enabled"] = 0
      -- Syntax highlighting
      -- vim.g.vimtex_syntax_enabled = 1
      -- Error suppression:
      -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
      -- vim.g['vimtex_compiler_progname'] = 'nvr'
      -- vim.g['vimtex_complete_close_braces'] = 1
    end,
  },
}
