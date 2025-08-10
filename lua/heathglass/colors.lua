-- HeathGlass Color Definitions
-- Semantic color palette following warm/cool principle

local M = {}

-- Generate color palette based on configuration
function M.get_colors(config)
  local colors = {
    -- Base colors
    none = "NONE",

    -- Background colors (respect transparency setting)
    bg = config.transparent and "NONE" or "#000000",
    bg_dark = config.transparent and "NONE" or "#000000",
    bg_float = config.transparent and "NONE" or "#111111",
    bg_sidebar = config.transparent and "NONE" or "#0a0a0a",

    -- Text colors
    fg = "#f2f2f2",        -- Primary text
    fg_dark = "#cccccc",   -- Secondary text
    fg_gutter = "#999999", -- Line numbers, comments

    -- UI elements
    border = "#333333",    -- Borders and separators
    selection = "#404040", -- Visual selections

    -- WARM COLORS - Control flow, actions, things that DO
    -- Inspired by melange: "Control flow should use warm colors"

    -- Lilac family for control structures (if, for, while, def)
    purple = "#a688c7",       -- Primary control flow keywords
    purple_light = "#c9b9db", -- Lighter accent for special keywords
    purple_dark = "#8f6db5",  -- Deeper shade for emphasis

    -- Mauve family for functions and methods (active elements)
    magenta = "#d489b8",       -- Function names and calls
    magenta_light = "#e2a8c9", -- Method calls and built-ins

    -- Peach family for variables and identifiers (things being acted upon)
    orange = "#d4a574",       -- Variable names
    orange_light = "#e1b88a", -- Parameters and properties
    orange_dark = "#c19660",  -- Constants and numbers

    -- COOL COLORS - Data, structure, things that ARE
    -- Inspired by melange: "Data should use cold colors"

    -- Sea-green family for data content (strings, literals)
    green = "#6bb89a",       -- String literals
    green_light = "#8cc7a8", -- Character literals and escapes
    green_dark = "#5aa388",  -- Regular expressions

    -- Teal family for structural definitions (types, classes)
    cyan = "#5cb3a8",       -- Type definitions
    cyan_light = "#7dc4bb", -- Built-in types
    cyan_dark = "#4a9b91",  -- Complex structures

    -- Slate-blue family for meta-programming (preprocessor, special)
    blue = "#7292b8",       -- Preprocessor directives
    blue_light = "#8da5c4", -- Special characters and macros

    -- Status and diagnostic colors
    red = "#fc8181",    -- Errors
    yellow = "#f6e05e", -- Warnings
    info = "#7292b8",   -- Info (using slate-blue)
    hint = "#5cb3a8",   -- Hints (using teal)

    -- Git colors
    git_add = "#6bb89a",    -- Added lines (sea-green)
    git_change = "#d4a574", -- Changed lines (peach)
    git_delete = "#fc8181", -- Deleted lines (red)

    -- Diff colors
    diff_add = "#0d4d25",    -- Diff added background
    diff_delete = "#4d0d15", -- Diff deleted background
    diff_change = "#4d3d0d", -- Diff changed background
    diff_text = "#664d0d",   -- Diff text background
  }

  -- Terminal colors for integrated terminal
  colors.terminal = {
    -- Normal colors
    terminal_black = "#1a1a1a",
    terminal_red = colors.red,
    terminal_green = colors.green,
    terminal_yellow = colors.yellow,
    terminal_blue = colors.blue,
    terminal_magenta = colors.magenta,
    terminal_cyan = colors.cyan,
    terminal_white = colors.fg,

    -- Bright colors
    terminal_bright_black = "#333333",
    terminal_bright_red = "#ff9999",
    terminal_bright_green = colors.green_light,
    terminal_bright_yellow = "#ffeb99",
    terminal_bright_blue = colors.blue_light,
    terminal_bright_magenta = colors.magenta_light,
    terminal_bright_cyan = colors.cyan_light,
    terminal_bright_white = "#ffffff",
  }

  return colors
end

return M
