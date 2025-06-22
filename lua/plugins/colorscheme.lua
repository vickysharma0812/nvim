return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false, -- Load the colorscheme immediately
    config = function()
      -- Load the Catppuccin colorscheme with the specified options
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        custom_highlights = function(colors)
          return {
            CmpBorder = { fg = colors.flamingo },
          }
        end,

        highlight_overrides = {
          mocha = function(colors)
            return {
              ["@variable"] = { fg = colors.text },
              ["@number"] = { fg = colors.flamingo, bg = colors.mantle, style = { "bold" } },
              ["@boolean"] = { fg = colors.pink },
              ["@string"] = { fg = colors.yellow, style = { "italic" } },
              ["@comment"] = { fg = colors.subtext0, style = { "italic" } },
              ["@type"] = { fg = colors.teal },
              ["@include"] = { fg = colors.sky, bg = colors.mantle },
              ["@attribute"] = { fg = colors.sapphire },
              ["@keyword"] = { fg = colors.teal, style = { "bold" } },

              ["@keyword.default"] = { fg = colors.rosewater, style = { "bold" } },

              ["@keyword.program"] = { fg = colors.flamingo, style = { "bold" } },
              ["@namespace.program"] = { fg = colors.flamingo, style = { "italic" } },

              ["@keyword.module"] = { fg = colors.rosewater, style = { "bold" } },
              ["@namespace.module"] = { fg = colors.rosewater, style = { "italic" } },

              ["@keyword.submodule"] = { fg = colors.rosewater, style = { "bold" } },
              ["@namespace.submodule"] = { fg = colors.rosewater, style = { "italic" } },

              ["@keyword.function"] = { fg = colors.pink, style = { "bold" } },
              ["@namespace.function"] = { fg = colors.pink, style = { "italic" } },

              ["@keyword.subroutine"] = { fg = colors.red, style = { "bold" } },
              ["@namespace.subroutine"] = { fg = colors.maroon, style = { "italic" } },
              ["@namespace.subroutine_call"] = { fg = colors.red, style = { "italic" } },
              ["@namespace.keyword_args"] = { fg = colors.mauve, style = { "italic" } },

              ["@keyword.module_procedure"] = { fg = colors.red, style = { "bold" } },
              ["@namespace.module_procedure"] = { fg = colors.maroon, style = { "italic" } },

              ["@keyword.interface"] = { fg = colors.flamingo, style = { "bold" } },

              ["@keyword.ifelse"] = { fg = colors.mauve, style = { "bold" } },
              ["@keyword.case"] = { fg = colors.sky, style = { "bold" } },

              ["@keyword.repeat"] = { fg = colors.sapphire, style = { "bold" } },

              ["@keyword.operator"] = { fg = colors.green },
              ["@keyword.bracket"] = { fg = colors.teal },
              ["@keyword.delimiter"] = { fg = colors.teal },
              ["@parameter"] = { fg = colors.green },
              ["@namespace.property"] = { fg = colors.sapphire, style = { "italic" } },
            }
          end,
        },

        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          -- comments = { "italic" }, -- Change the style of comments
          -- conditionals = {},
          -- loops = { "bold" },
          -- functions = { "bold" },
          -- keywords = { "bold" },
          -- strings = { "italic" },
          -- variables = { "italic" },
          -- numbers = { "italic" },
          -- booleans = {},
          -- properties = { "bold" },
          -- types = {},
          -- operators = {},
        },
        color_overrides = {},
        integration_default = false, -- set to true/false to enable/disable integrations by default
        integrations = {
          aerial = true,
          bufferline = true,
          blink_cmp = {
            enabled = true,
            style = "bordered", -- nvchad, catppuccin, or default
          },
          cmp = true,
          diffview = true,
          flash = true,
          gitsigns = true,
          gitgutter = true,
          harpoon = true,
          headlines = true,
          illuminate = {
            enabled = true,
            lsp = true,
          },
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
          mini = { enabled = true, indentscope_color = "" },
          markdown = true,
          markview = true,
          octo = true,
          overseer = true,
          symbols_outline = true,
          semantic_tokens = true,
          snacks = {
            enabled = true,
            indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          },
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
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
