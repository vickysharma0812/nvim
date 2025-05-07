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
    -- triggers = { "<leader>" }, -- or specify a list manually
    -- defaults = {
    --   mode = "n", -- NORMAL mode
    --   prefix = " ", -- "<leader>",
    --   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    --   silent = true, -- use `silent` when creating keymaps
    --   noremap = true, -- use `noremap` when creating keymaps
    --   nowait = true, -- use `nowait` when creating keymaps
    -- },
  },
  -- config = function(_, opts)
  --   local wk = require("which-key")
  --   wk.setup(opts)
  --   -- wk.register(opts.mappings, opts.defaults)
  -- end,
  keys = {
    { "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Find buffers", nowait = true, remap = false },
    { "<leader>.", "<cmd>JABSOpen<cr>", desc = "Find files", nowait = true, remap = false },
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "Find files", nowait = true, remap = false },
    { "<leader>Bd", "<cmd>tabclose<CR>", desc = "Close Tab", nowait = true, remap = false },
    { "<leader>Bh", "<cmd>tabprevious<CR>", desc = "Previous Tab", nowait = true, remap = false },
    { "<leader>Bl", "<cmd>tabnext<CR>", desc = "Next Tab", nowait = true, remap = false },
    { "<leader>Bn", "<cmd>tabnew<CR>", desc = "New Tab", nowait = true, remap = false },
    { "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>Pb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers", nowait = true, remap = false },
    { "<leader>Pf", "<cmd>FzfLua files<CR>", desc = "Find files", nowait = true, remap = false },
    { "<leader>Pg", "<cmd>FzfLua live_grep<CR>", desc = "Search string live_grep", nowait = true, remap = false },
    { "<leader>Ph", "<cmd>Fzf tags<CR>", desc = "Search tags", nowait = true, remap = false },
    { "<leader>Ps", "<cmd>FzfLua grep_project<CR>", desc = "Search text in project", nowait = true, remap = false },
    { "<leader>Pv", "<cmd>NvimTreeToggle<CR>", desc = "Open Explorer", nowait = true, remap = false },
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", nowait = true, remap = false },
    {
      "<leader>bd",
      function(n)
        require("mini.bufremove").delete(n, false)
      end,
      desc = "Close buffer",
      nowait = true,
      remap = false,
    },
    { "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format buffer", nowait = true, remap = false },
    { "<leader>bh", "<cmd>bprevious<CR>", desc = "Previous buffer", nowait = true, remap = false },
    { "<leader>bl", "<cmd>bnext<CR>", desc = "Next buffer", nowait = true, remap = false },
    { "<leader>bw", "<cmd>lua vim.cmd.w()<CR>", desc = "Save buffer", nowait = true, remap = false },
    { "<leader>cI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    {
      "<leader>cS",
      "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
      desc = "Live Workspace Symbols",
      nowait = true,
      remap = false,
    },
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
    { "<leader>cs", "<cmd>Lspsaga outline<cr>", desc = "Symbols outline (Lspsaga)", nowait = true, remap = false },
    {
      "<leader>cw",
      "<cmd>FzfLua diagnostics_workspace<cr>",
      desc = "Workspace Diagnostics",
      nowait = true,
      remap = false,
    },
    { "<leader>e", "<cmd>Neotree toggle float<cr>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>fF", "<cmd>FzfLua oldfiles resume=true<CR>", desc = "Find files", nowait = true, remap = false },
    { "<leader>f/", "<cmd>Neotree filesystem reveal right<CR>", desc = "Show file in right", nowait = true, remap = false },
    { "<leader>f\\", "<cmd>Neotree filesystem reveal left<CR>", desc = "Show file in left", nowait = true, remap = false },
    { "<leader>fS", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle spectre", nowait = true, remap = false },
    {
      "<leader>fcT",
      ":e ~/.config/alacritty/alacritty.yml <CR>",
      desc = "Alacritty yml",
      nowait = true,
      remap = false,
    },
    { "<leader>fca", ":e ~/.config/awesome/rc.lua <CR>", desc = "Awesome", nowait = true, remap = false },
    {
      "<leader>fcf",
      ":e ~/.config/nvim/snippets/easifem-fortran.json <CR>",
      desc = "Fortran snippets",
      nowait = true,
      remap = false,
    },
    {
      "<leader>fcm",
      ":e ~/.config/nvim/snippets/easifem-markdown.json <CR>",
      desc = "Markdown snippets",
      nowait = true,
      remap = false,
    },
    { "<leader>fcs", ":e ~/.config/omf/init.fish <CR>", desc = "Shell", nowait = true, remap = false },
    {
      "<leader>fct",
      ":e ~/.config/alacritty/alacritty.toml <CR>",
      desc = "Alacritty toml",
      nowait = true,
      remap = false,
    },
    { "<leader>fcz", ":e ~/.config/zellij/config.kdl <CR>", desc = "Zellij", nowait = true, remap = false },
    { "<leader>fd", "<cmd>Bdelete<CR>", desc = "Close file", nowait = true, remap = false },
    { "<leader>ff", "<cmd>FzfLua files resume=true<CR>", desc = "Find files", nowait = true, remap = false },
    { "<leader>fg", "<cmd>FzfLua git_files<CR>", desc = "Find Git files", nowait = true, remap = false },
    {
      "<leader>fo",
      "<cmd>Neotree position=float reveal_force_cwd=true dir=%:p:h reveal_file=%:p<CR>",
      desc = "Reveal file in tree",
      nowait = true,
      remap = false,
    },
    {
      "<leader>fp",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "find on current file",
      nowait = true,
      remap = false,
    },
    { "<leader>fr", "<cmd>FzfLua oldfiles resume=true<CR>", desc = "Find files", nowait = true, remap = false },
    {
      "<leader>fw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "find current word spectre",
      nowait = true,
      remap = false,
    },
    { "<leader>gD", "<cmd>lua require 'gitsigns'.diffthis('~')<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Find git files", nowait = true, remap = false },
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "NeoGit", nowait = true, remap = false },
    { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit", nowait = true, remap = false },
    { "<leader>go", "<cmd>FzfLua git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
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
    { "<leader>oR", "<cmd>OverseerRestartLast<CR>", desc = "Overseer Restart last cmd", nowait = true, remap = false },
    { "<leader>od", "<cmd>OverseerClose<CR>", desc = "Overseer close", nowait = true, remap = false },
    { "<leader>oo", "<cmd>OverseerOpen<CR>", desc = "Overseer open", nowait = true, remap = false },
    { "<leader>oq", "<cmd>OverseerQuickAction<CR>", desc = "Overseer quick action", nowait = true, remap = false },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run", nowait = true, remap = false },
    { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle", nowait = true, remap = false },
    { "<leader>ow", "<cmd>WatchRun<CR>", desc = "Watch run", nowait = true, remap = false },
    {
      "<leader>sB",
      "<cmd>lua require('fzf-lua').lines()<CR>",
      desc = "fzf find in open buffer lines",
      nowait = true,
      remap = false,
    },
    { "<leader>sC", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>sH", "<cmd>Telescope heading<cr>", desc = "Documents headings", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>FzfLua registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    {
      "<leader>sb",
      "<cmd>lua require('fzf-lua').blines()<CR>",
      desc = "fzf find in current buffer lines",
      nowait = true,
      remap = false,
    },
    { "<leader>sc", "<cmd>FzfLua commands<cr>", desc = "Commands", nowait = true, remap = false },
    {
      "<leader>sd",
      "<cmd>FzfLua lsp_document_diagnostics<cr>",
      desc = "Docment diagnostics",
      nowait = true,
      remap = false,
    },
    { "<leader>se", "<cmd>Telescope symbols<cr>", desc = "Pick a Symbols", nowait = true, remap = false },
    { "<leader>sf", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep in current buffer", nowait = true, remap = false },
    { "<leader>sg", "<cmd>FzfLua grep_project<cr>", desc = "Grep project", nowait = true, remap = false },
    { "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sl", "<cmd>FzfLua blines<cr>", desc = "current buffer lines", nowait = true, remap = false },
    { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Search projects", nowait = true, remap = false },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>st", "<cmd>FzfLua tabs<cr>", desc = "Open tabs", nowait = true, remap = false },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word",
      nowait = true,
      remap = false,
    },
    { "<leader>sx", "<cmd>FzfLua quickfix<cr>", desc = "quickfix list", nowait = true, remap = false },
    { "<leader>sy", "<cmd>FzfLua loclist<cr>", desc = "location list", nowait = true, remap = false },
    { "<leader>tH", "<cmd>Hardtime toggle<CR>", desc = "Toggle hardtime", nowait = true, remap = false },
    {
      "<leader>tP",
      'lua require("precognition").toggle()<CR>',
      desc = "Toggle precognition",
      nowait = true,
      remap = false,
    },
    {
      "<leader>tb",
      "<cmd>Neotree source=buffers reveal=true action=focus position=float toggle=true<cr>",
      desc = "Toggle buffer to right",
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
    { "<leader>ts", "<cmd>SymbolsOutline<cr>", desc = "Toggle Symbol-outline", nowait = true, remap = false },
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal", nowait = true, remap = false },
    {
      "<leader>txD",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Toggle workspace diagnostic",
      nowait = true,
      remap = false,
    },
    {
      "<leader>txR",
      "<cmd>TroubleToggle lsp_references<cr>",
      desc = "TroubleToggle lsp references",
      nowait = true,
      remap = false,
    },
    {
      "<leader>txd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Toggle document diagnostic",
      nowait = true,
      remap = false,
    },
    { "<leader>txl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle loclist", nowait = true, remap = false },
    { "<leader>txq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle qickfix", nowait = true, remap = false },
    { "<leader>txx", "<cmd>TroubleToggle<cr>", desc = "TroubleToggle", nowait = true, remap = false },
    { "<leader>tz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode", nowait = true, remap = false },
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
    { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode", nowait = true, remap = false },
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "harpoon add",
      nowait = true,
      remap = false,
    },
    {
      "<leader>hr",
      function()
        require("harpoon"):list():remove()
      end,
      desc = "harpoon remove",
      nowait = true,
      remap = false,
    },
    {
      "<leader>hm",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon menu",
      nowait = true,
      remap = false,
    },
    {
      "<leader>hn",
      function()
        require("harpoon"):list():next()
      end,
      desc = "harpoon next file",
      nowait = true,
      remap = false,
    },
    {
      "<leader>hp",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "harpoon prev file",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "harpoon file 1",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "harpoon file 2",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "harpoon file 3",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "harpoon file 4",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "harpoon file 5",
      nowait = true,
      remap = false,
    },
    {
      "<leader>h6",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "harpoon file 6",
      nowait = true,
      remap = false,
    },
  },
}
