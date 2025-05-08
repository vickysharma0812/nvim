return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    motion = {
      count = true,
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true,
    triggers = {
      { "<auto>", mode = "nxsot" },
    },
  },
  keys = {
    { "<leader>Bd", "<cmd>tabclose<CR>", desc = "Close Tab", nowait = true, remap = false },
    { "<leader>Bh", "<cmd>tabprevious<CR>", desc = "Previous Tab", nowait = true, remap = false },
    { "<leader>Bl", "<cmd>tabnext<CR>", desc = "Next Tab", nowait = true, remap = false },
    { "<leader>Bn", "<cmd>tabnew<CR>", desc = "New Tab", nowait = true, remap = false },
    { "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format buffer", nowait = true, remap = false },
    { "<leader>bb", "<cmd>bprevious<CR>", desc = "Previous buffer", nowait = true, remap = false },
    { "<leader>bh", "<cmd>bprevious<CR>", desc = "Previous buffer", nowait = true, remap = false },
    { "<leader>bl", "<cmd>bnext<CR>", desc = "Next buffer", nowait = true, remap = false },
    { "<leader>bw", "<cmd>lua vim.cmd.w()<CR>", desc = "Save buffer", nowait = true, remap = false },
    { "<leader>cI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    {
      "<leader>cd",
      "<cmd>FzfLua diagnostics_document<cr>",
      desc = "Document Diagnostics",
      nowait = true,
      remap = false,
    },
    { "<leader>cf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>ci", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    {
      "<leader>cj",
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      desc = "Next Diagnostic",
      nowait = true,
      remap = false,
    },
    {
      "<leader>ck",
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      desc = "Prev Diagnostic",
      nowait = true,
      remap = false,
    },
    { "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>cq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    {
      "<leader>fcf",
      ":e ~/.config/nvim/snippets/easifem-fortran.json <CR>",
      desc = "Fortran snippets",
      nowait = true,
      remap = false,
    },
    {
      "<leader>fcm",
      ":e ~/.config/nvim/snippets/easifem-markdown-docusaurus.json <CR>",
      desc = "Markdown snippets",
      nowait = true,
      remap = false,
    },
    {
      "<leader>fct",
      ":e ~/.config/alacritty/alacritty.toml <CR>",
      desc = "Alacritty toml",
      nowait = true,
      remap = false,
    },
    { "<leader>fcz", ":e ~/.config/zellij/config.kdl <CR>", desc = "Zellij", nowait = true, remap = false },
    { "<leader>gD", "<cmd>lua require 'gitsigns'.diffthis('~')<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "NeoGit", nowait = true, remap = false },
    { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit", nowait = true, remap = false },
    {
      "<leader>gp",
      "<cmd>Gitsigns preview_hunk_inline<cr>",
      desc = "Preview Hunk Inline",
      nowait = true,
      remap = false,
    },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    {
      "<leader>nd",
      "lua require('notify').dismiss({ silent = true, pending = true })",
      desc = "Delete all Notifications",
      nowait = true,
      remap = false,
    },
    {
      "<leader>oR",
      "<cmd>OverseerRestartLast<CR>",
      desc = "Overseer Restart last cmd",
      nowait = true,
      remap = false,
    },
    { "<leader>od", "<cmd>OverseerClose<CR>", desc = "Overseer close", nowait = true, remap = false },
    { "<leader>oo", "<cmd>OverseerOpen<CR>", desc = "Overseer open", nowait = true, remap = false },
    { "<leader>oq", "<cmd>OverseerQuickAction<CR>", desc = "Overseer quick action", nowait = true, remap = false },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run", nowait = true, remap = false },
    { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle", nowait = true, remap = false },
    { "<leader>ow", "<cmd>WatchRun<CR>", desc = "Watch run", nowait = true, remap = false },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word",
      nowait = true,
      remap = false,
    },
    {
      "<leader>tc",
      "lua require('copilot.suggestion').toggle_auto_trigger()",
      desc = "Toggle copilot auto suggestion",
      nowait = true,
      remap = false,
    },
    { "<leader>td", "<cmd>tabclose<CR>", desc = "Close Tab", nowait = true, remap = false },
    { "<leader>th", "<cmd>tabprevious<CR>", desc = "Previous Tab", nowait = true, remap = false },
    { "<leader>tl", "<cmd>tabnext<CR>", desc = "Next Tab", nowait = true, remap = false },
    { "<leader>tn", "<cmd>tabnew<CR>", desc = "New Tab", nowait = true, remap = false },
    { "<leader>wN", "<cmd>vnew<CR>", desc = "Vertical new window", nowait = true, remap = false },
    { "<leader>wd", "<cmd>close<CR>", desc = "Close window", nowait = true, remap = false },
    { "<leader>wh", "<C-w>h", desc = "Go to left window", nowait = true, remap = false },
    { "<leader>wj", "<C-w>j", desc = "Go to down window", nowait = true, remap = false },
    { "<leader>wk", "<C-w>k", desc = "Go to up window", nowait = true, remap = false },
    { "<leader>wl", "<C-w>l", desc = "Go to right window", nowait = true, remap = false },
    { "<leader>wn", "<cmd>new<CR>", desc = "New window", nowait = true, remap = false },
    { "<leader>ws", group = "Window split", nowait = true, remap = false },
    { "<leader>wsh", "<cmd>vsplit<CR>", desc = "Split window to left", nowait = true, remap = false },
    { "<leader>wsj", "<cmd>split<CR>", desc = "Split window to down", nowait = true, remap = false },
    { "<leader>wsk", "<cmd>split<CR>", desc = "Split window to up", nowait = true, remap = false },
    { "<leader>wsl", "<cmd>vsplit<CR>", desc = "Split window to right", nowait = true, remap = false },
    { "<leader>zM", "lua require('ufo').closeAllFolds<cr>", desc = "Close all folds", nowait = true, remap = false },
    { "<leader>zR", "lua require('ufo').openAllFolds<cr>", desc = "Open all folds", nowait = true, remap = false },
    {
      "<leader>zr",
      "lua require('ufo').openFoldsExceptKinds<cr>",
      desc = "Open all folds except kinds",
      nowait = true,
      remap = false,
    },
  },
}
