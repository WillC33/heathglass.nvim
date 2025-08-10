-- HeathGlass Neovim Theme
-- Main plugin entry point

local M = {}

-- Default configuration
local defaults = {
  transparent = false,    -- Enable transparent background
  terminal_colors = true, -- Configure terminal colors
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = {},
  },
}

-- Plugin configuration
M.config = defaults

-- Setup function - modern plugin entry point
function M.setup(opts)
  -- Merge user config with defaults
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})

  -- Automatically load the theme after setup
  M.load()
end

-- Load the colorscheme
function M.load()
  -- Clear existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "heathglass"
  vim.o.termguicolors = true

  -- Load colors and apply highlights
  local colors = require("heathglass.colors").get_colors(M.config)
  local highlights = require("heathglass.highlights").get_highlights(colors, M.config)

  -- Apply user customizations
  if M.config.on_colors then
    M.config.on_colors(colors)
  end

  if M.config.on_highlights then
    M.config.on_highlights(highlights, colors)
  end

  -- Apply all highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Set terminal colors if enabled
  if M.config.terminal_colors then
    require("heathglass.terminal").setup(colors)
  end

  -- Ensure theme persists after plugins load
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("HeathGlassReapply", { clear = true }),
    callback = function()
      -- Re-apply key highlights that plugins often override
      vim.api.nvim_set_hl(0, "Directory", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "Comment", highlights.Comment)
      vim.api.nvim_set_hl(0, "Function", highlights.Function)
      vim.api.nvim_set_hl(0, "Keyword", highlights.Keyword)
    end,
  })
end

-- Convenience function for colorscheme command
function M.colorscheme()
  M.load()
end

return M
