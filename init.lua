if vim.g.vscode then
  return
elseif vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18:Thin"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_scale_factor = 1.0
  -- vim.opt.linespace = 0
  vim.g.neovide_position_animation_length = 0.15
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_fullscreen = true
  vim.g.neovide_macos_simple_fullscreen = true
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  vim.g.neovide_cursor_animation_length = 0.150
  vim.g.neovide_cursor_trail_size = 1.0 -- 0 to 1

  vim.g.neovide_cursor_antialiasing = true

  vim.g.neovide_cursor_animate_in_insert_mode = true

  vim.g.neovide_cursor_vfx_mode = "railgun" 
  -- possible values: railgun, ripple, sonicboom, wireframe, torpedo, 
  -- dot, beacon, pixiedust
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
    keymaps = false,
  },
  news = {
    neovim = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  checker = {
    enabled = false,
    concurrency = nil,
    notify = false,
    frequency = 3600,
    check_pinned = true,
  },
})

require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.redir")

-- vim.cmd.colorscheme("catppuccin")
