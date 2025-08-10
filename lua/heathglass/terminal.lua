-- HeathGlass Terminal Colors
-- Sets up terminal colors for integrated terminal

local M = {}

function M.setup(colors)
  if not colors.terminal then return end

  -- Set terminal colors
  vim.g.terminal_color_0 = colors.terminal.terminal_black
  vim.g.terminal_color_1 = colors.terminal.terminal_red
  vim.g.terminal_color_2 = colors.terminal.terminal_green
  vim.g.terminal_color_3 = colors.terminal.terminal_yellow
  vim.g.terminal_color_4 = colors.terminal.terminal_blue
  vim.g.terminal_color_5 = colors.terminal.terminal_magenta
  vim.g.terminal_color_6 = colors.terminal.terminal_cyan
  vim.g.terminal_color_7 = colors.terminal.terminal_white
  vim.g.terminal_color_8 = colors.terminal.terminal_bright_black
  vim.g.terminal_color_9 = colors.terminal.terminal_bright_red
  vim.g.terminal_color_10 = colors.terminal.terminal_bright_green
  vim.g.terminal_color_11 = colors.terminal.terminal_bright_yellow
  vim.g.terminal_color_12 = colors.terminal.terminal_bright_blue
  vim.g.terminal_color_13 = colors.terminal.terminal_bright_magenta
  vim.g.terminal_color_14 = colors.terminal.terminal_bright_cyan
  vim.g.terminal_color_15 = colors.terminal.terminal_bright_white
end

return M
