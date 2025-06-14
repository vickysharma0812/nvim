local fn = vim.fn

-- Configuration table for easy customization
local config = {
  filename_limit = 35,           -- Increased from 31 for better readability
  use_icons = true,              -- Enable file type icons
  relative_paths = true,         -- Show relative paths when possible
  highlight_current = true,      -- Highlight current file differently
  max_text_length = 80,         -- Truncate long error messages
  show_bufnr = false,           -- Option to show buffer numbers
}

-- File type icons (requires a nerd font)
local file_icons = {
  lua = "󰢱",
  js = "󰌞",
  ts = "󰛦",
  py = "󰌠",
  go = "󰟓",
  rust = "󱘗",
  c = "󰙱",
  cpp = "󰙲",
  java = "󰬷",
  html = "󰌝",
  css = "󰌜",
  json = "󰘦",
  md = "󰍔",
  txt = "󰈙",
  default = "󰈙"
}

-- Error type styling
local error_types = {
  E = { symbol = "󰅚", name = "Error" },
  W = { symbol = "󰀪", name = "Warning" },
  I = { symbol = "󰋽", name = "Info" },
  N = { symbol = "󰋼", name = "Note" },
  H = { symbol = "󰌶", name = "Hint" },
  [""] = { symbol = "", name = "" }
}

-- Get file icon based on extension
local function get_file_icon(filename)
  if not config.use_icons then return "" end
  
  local ext = filename:match("%.([^%.]+)$")
  if not ext then return file_icons.default end
  
  return file_icons[ext:lower()] or file_icons.default
end

-- Get relative path from current working directory
local function get_relative_path(filepath)
  if not config.relative_paths then return filepath end
  
  local cwd = vim.fn.getcwd()
  if filepath:sub(1, #cwd) == cwd then
    local relative = filepath:sub(#cwd + 2) -- +2 to skip the trailing slash
    return relative ~= "" and relative or filepath
  end
  return filepath
end

-- Format filename with proper truncation and visual width handling
local function format_filename(fname, limit)
  if fname == "" then return "[No Name]" end
  
  -- Convert home directory to ~
  fname = fname:gsub("^" .. vim.env.HOME, "~")
  
  -- Get relative path if configured
  fname = get_relative_path(fname)
  
  -- Handle wide characters properly (basic approach)
  local display_width = vim.fn.strdisplaywidth(fname)
  
  if display_width <= limit then
    -- Pad with spaces to maintain alignment
    local padding = limit - display_width
    return fname .. string.rep(" ", padding)
  else
    -- Truncate with ellipsis, accounting for display width
    local truncated = fname
    while vim.fn.strdisplaywidth("…" .. truncated) > limit and #truncated > 1 do
      truncated = truncated:sub(2)
    end
    return "…" .. truncated
  end
end

-- Format error message with truncation
local function format_text(text, max_length)
  if not text or text == "" then return "" end
  
  -- Remove leading/trailing whitespace
  text = text:gsub("^%s+", ""):gsub("%s+$", "")
  
  -- Truncate if too long
  if config.max_text_length and #text > config.max_text_length then
    return text:sub(1, config.max_text_length - 1) .. "…"
  end
  
  return text
end

function _G.qftf(info)
  local items
  local ret = {}
  
  -- Get items from quickfix or location list
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  
  -- Early return if no items
  if not items or #items == 0 then
    return ret
  end
  
  local limit = config.filename_limit
  local current_buf = vim.api.nvim_get_current_buf()
  
  -- Format strings with better spacing
  local validFmt = "%s%s %s │ %5s:%-3s │ %s%s"
  
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    if not e then break end -- Safety check
    
    local str
    if e.valid == 1 then
      -- Get filename and format it
      local fname = ""
      local icon = ""
      local bufnr_str = config.show_bufnr and string.format("[%d] ", e.bufnr) or ""
      
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == "" then
          fname = "[No Name]"
        else
          icon = get_file_icon(fname)
          if icon ~= "" then icon = icon .. " " end
        end
        fname = format_filename(fname, limit)
      end
      
      -- Format line and column numbers
      local lnum = e.lnum > 99999 and "99999+" or tostring(e.lnum)
      local col = e.col > 999 and "999+" or tostring(e.col)
      
      -- Get error type info
      local error_info = error_types[e.type] or error_types[""]
      local qtype = error_info.symbol ~= "" and error_info.symbol .. " " or ""
      
      -- Format the error text
      local text = format_text(e.text)
      
      str = validFmt:format(bufnr_str, icon, fname, lnum, col, qtype, text)
    else
      -- Invalid entries (usually section headers)
      str = e.text or ""
    end
    
    table.insert(ret, str)
  end
  
  return ret
end

-- Set the quickfix text function
vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

-- Optional: Add a command to toggle configuration options
vim.api.nvim_create_user_command("QfToggleIcons", function()
  config.use_icons = not config.use_icons
  print("Quickfix icons " .. (config.use_icons and "enabled" or "disabled"))
  -- Refresh quickfix window if open
  if vim.fn.getqflist({winid = 0}).winid ~= 0 then
    vim.cmd("copen")
  end
end, { desc = "Toggle quickfix file type icons" })

vim.api.nvim_create_user_command("QfToggleRelative", function()
  config.relative_paths = not config.relative_paths
  print("Quickfix relative paths " .. (config.relative_paths and "enabled" or "disabled"))
  if vim.fn.getqflist({winid = 0}).winid ~= 0 then
    vim.cmd("copen")
  end
end, { desc = "Toggle quickfix relative paths" })
