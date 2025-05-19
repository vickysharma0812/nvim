return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = {},
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integration_default = nil, -- set to true/false to enable/disable integrations by default
      integrations = {
        aerial = true,
        bufferline = true,
        cmp = true,
        diffview = true,
        flash = true,
        gitsigns = true,
        gitgutter = true,
        harpoon = true,
        headlines = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        lsp_trouble = true,
        lsp_saga = true,
        nvimtree = true,
        neotree = true,
        noice = true,
        notify = true,
        notifier = true,
        neogit = true,
        ufo = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        markdown = true,
        octo = true,
        overseer = true,
        symbols_outline = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        telekasten = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
        -- comments = { italic = true },
        -- keywords = { italic = false },
        -- functions = { bold = false, italic = true },
        -- variables = { bold = },
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      --- 'auto'|'main'|'moon'|'dawn'
      variant = "dawn",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "rose-pine"
    end,
  },
}
