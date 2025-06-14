local function augroup(name)
  return vim.api.nvim_create_augroup("PengVim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("expr_folding"),
  pattern = { "fortran", "lua" },
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldtext = "v:lua.vim.treesitter.foldtext()"
    vim.opt_local.foldnestmax = 1
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("no_folding"),
  pattern = { "Noice", "dashboard" },
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.foldcolumn = "0"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("set_fmt"),
  pattern = { "fortran" },
  callback = function()
    vim.cmd(
      [[ set efm=%-Ggfortran%.%#,%A%f:%l:%c:,%A%f:%l:,%C,%C%p%*[0123456789^],%Z%trror:\ %m,,%Z%tarning:\ %m,%C%.%#,%-G%.%# ]]
    -- [[ set efm=%A%f:%l:%c:,%C,%C,%C,%Z%trror:\ %m,,%Z%tarning:\ %m,%C%.%#,%-G%.%# ]]
    )
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("hide_decorations"),
  pattern = { "*" },
  callback = function()
    vim.cmd("set laststatus=0")
  end,
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
    vmap("<leader>bf", vim.lsp.buf.format, "[l]sp [f]ormat")

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

-- typst related
-- 
-- The code below is taken from here https://myriad-dreamin.github.io/tinymist/frontend/neovim.htmlhttps://myriad-dreamin.github.io/tinymist/frontend/neovim.html
-- This preview method is slower because of compilation delays, and additional delays in the pdf reader refreshing.
-- It is often useful to have a command that opens the current file in the reader.
vim.api.nvim_create_user_command("OpenPdf", function()

  local filepath = vim.api.nvim_buf_get_name(0)

  if filepath:match("%.typ$") then

    local pdf_path = filepath:gsub("%.typ$", ".pdf")

    vim.system({ "open", pdf_path })

  end

end, {})
