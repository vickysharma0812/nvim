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
      transparent_background = false, -- disables setting the background color.
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
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      transparent = true,
      dim_inactive = true,
      palettes = {
        -- Custom duskfox with black background
        carbonfox = {
          bg1 = "#000000", -- Black background
          bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
          -- bg3 = "#121820", -- 55% darkened from stock
          -- sel0 = "#131b24", -- 55% darkened from stock
        },
      },
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
        strings = "italic",
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        numbers = "NONE",
        operators = "NONE",
        variables = "NONE",
      },
      modules = {
        alpha = true,
        barbar = true,
        cmp = true,
        gitgutter = true,
        gitsigns = true,
        hop = true,
        indent_blanklines = true,
        leap = true,
        lsp_saga = true,
        lsp_trouble = true,
        mini = true,
        navic = true,
        neotree = true,
        notify = true,
        symbol_outline = true,
        telescope = true,
        treesitter = true,
        whichkey = true,
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
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyVirtualTextColor = true
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      --- 'auto'|'main'|'moon'|'dawn'
      variant = "auto",
      --- 'main'|'moon'|'dawn'
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,

      --- string hex value or named color from rosepinetheme.com/palette
      groups = {
        background = "base",
        background_nc = "_experimental_nc",
        panel = "surface",
        panel_nc = "base",
        border = "highlight_med",
        comment = "muted",
        link = "iris",
        punctuation = "subtle",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- Change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/Recipes
      highlight_groups = {
        ColorColumn = { bg = "rose" },

        -- Blend colours against the "base" background
        CursorLine = { bg = "foam", blend = 10 },
        StatusLine = { fg = "love", bg = "love", blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = "gold", inherit = false },
      },
    },
  },
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "dragon", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      borderless_telescope = true,
      terminal_colors = true,
    },
  },
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- opts.colorscheme = "tokyonight"
      -- opts.colorscheme = "gruvbuddy"
      opts.colorscheme = "catppuccin"
    end,
  },
}
