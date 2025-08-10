-- HeathGlass Highlight Definitions
-- Semantic highlighting following warm/cool principle

local M = {}

-- Generate highlight groups based on colors and config
function M.get_highlights(colors, config)
  local highlights = {}

  -- Helper function to apply style configurations
  local function style(base_style, style_config)
    if not style_config then return base_style end
    return vim.tbl_extend("force", base_style, style_config)
  end

  -- CORE UI ELEMENTS
  highlights.Normal = { fg = colors.fg, bg = colors.bg }
  highlights.NormalFloat = { fg = colors.fg, bg = colors.bg_float }
  highlights.NormalNC = { fg = colors.fg, bg = colors.bg }

  -- Cursor and lines
  highlights.Cursor = { fg = colors.bg, bg = colors.fg }
  highlights.CursorLine = { bg = colors.selection }
  highlights.CursorColumn = { bg = colors.selection }
  highlights.CursorLineNr = { fg = colors.purple_light, bold = true }
  highlights.LineNr = { fg = colors.fg_gutter, bg = colors.bg }
  highlights.SignColumn = { bg = colors.bg }
  highlights.ColorColumn = { bg = colors.selection }

  -- Splits and borders
  highlights.VertSplit = { fg = colors.border, bg = colors.bg }
  highlights.WinSeparator = { fg = colors.border, bg = colors.bg }

  -- Selection and search
  highlights.Visual = { bg = colors.selection }
  highlights.VisualNOS = { bg = colors.selection }
  highlights.Search = { fg = colors.bg, bg = colors.orange }
  highlights.IncSearch = { fg = colors.bg, bg = colors.magenta }
  highlights.CurSearch = { fg = colors.bg, bg = colors.magenta }
  highlights.Substitute = { fg = colors.bg, bg = colors.red }

  -- Matching
  highlights.MatchParen = { fg = colors.magenta_light, bold = true }

  -- Completion menu
  highlights.Pmenu = { fg = colors.fg, bg = colors.bg_float }
  highlights.PmenuSel = { fg = colors.bg, bg = colors.purple }
  highlights.PmenuSbar = { bg = colors.border }
  highlights.PmenuThumb = { bg = colors.fg_gutter }
  highlights.WildMenu = { fg = colors.bg, bg = colors.purple }

  -- Status line and tabs
  highlights.StatusLine = { fg = colors.fg, bg = colors.bg_float }
  highlights.StatusLineNC = { fg = colors.fg_dark, bg = colors.bg }
  highlights.TabLine = { fg = colors.fg_dark, bg = colors.bg }
  highlights.TabLineFill = { bg = colors.bg }
  highlights.TabLineSel = { fg = colors.bg, bg = colors.purple }

  -- Folds
  highlights.Folded = { fg = colors.fg_dark, bg = colors.bg_float }
  highlights.FoldColumn = { fg = colors.fg_gutter, bg = colors.bg }

  -- Diff
  highlights.DiffAdd = { bg = colors.diff_add }
  highlights.DiffChange = { bg = colors.diff_change }
  highlights.DiffDelete = { bg = colors.diff_delete }
  highlights.DiffText = { bg = colors.diff_text }

  -- Spell
  highlights.SpellBad = { undercurl = true, sp = colors.red }
  highlights.SpellCap = { undercurl = true, sp = colors.yellow }
  highlights.SpellLocal = { undercurl = true, sp = colors.info }
  highlights.SpellRare = { undercurl = true, sp = colors.hint }

  -- Messages
  highlights.ErrorMsg = { fg = colors.red }
  highlights.WarningMsg = { fg = colors.yellow }
  highlights.Question = { fg = colors.blue }
  highlights.ModeMsg = { fg = colors.fg_dark }
  highlights.MoreMsg = { fg = colors.blue }

  -- Misc
  highlights.NonText = { fg = colors.fg_gutter }
  highlights.SpecialKey = { fg = colors.fg_gutter }
  highlights.Whitespace = { fg = colors.fg_gutter }
  highlights.EndOfBuffer = { fg = colors.bg }
  highlights.Directory = { fg = colors.cyan }
  highlights.Title = { fg = colors.purple, bold = true }

  -- SEMANTIC SYNTAX HIGHLIGHTING
  -- Following melange principle: warm for control, cool for data

  -- WARM COLORS - Control flow and actions

  -- Control structures (lilac tones) - guide logical flow
  highlights.Keyword = style({ fg = colors.purple }, config.styles.keywords)
  highlights.Conditional = style({ fg = colors.purple }, config.styles.keywords)
  highlights.Repeat = style({ fg = colors.purple }, config.styles.keywords)
  highlights.Exception = style({ fg = colors.purple }, config.styles.keywords)
  highlights.Include = { fg = colors.purple }
  highlights.StorageClass = { fg = colors.purple }
  highlights.Structure = { fg = colors.purple }
  highlights.Typedef = { fg = colors.purple }

  -- Functions and methods (mauve tones) - active elements
  highlights.Function = style({ fg = colors.magenta }, config.styles.functions)
  highlights.Identifier = style({ fg = colors.magenta }, config.styles.functions)
  highlights.Statement = { fg = colors.magenta }

  -- Variables and data being acted upon (peach tones)
  highlights.Variable = style({ fg = colors.orange }, config.styles.variables)
  highlights.Constant = { fg = colors.orange_dark }
  highlights.Number = { fg = colors.orange_light }
  highlights.Float = { fg = colors.orange_light }
  highlights.Boolean = { fg = colors.orange_light }

  -- COOL COLORS - Data and structure

  -- Strings and data content (sea-green tones)
  highlights.String = { fg = colors.green }
  highlights.Character = { fg = colors.green_light }

  -- Types and structural definitions (teal tones)
  highlights.Type = { fg = colors.cyan }
  highlights.TypeDef = { fg = colors.cyan }

  -- Comments (muted tones) - passive information
  highlights.Comment = style({ fg = colors.fg_gutter }, config.styles.comments)
  highlights.SpecialComment = style({ fg = colors.fg_dark }, config.styles.comments)
  highlights.Todo = { fg = colors.yellow, bold = true }
  highlights.Note = { fg = colors.info, bold = true }

  -- Operators and punctuation (neutral) - structural connectors
  highlights.Operator = { fg = colors.fg_dark }
  highlights.Delimiter = { fg = colors.fg_dark }
  highlights.Punctuation = { fg = colors.fg_dark }

  -- Special syntax (slate-blue) - meta-programming
  highlights.Special = { fg = colors.blue }
  highlights.SpecialChar = { fg = colors.blue_light }
  highlights.Tag = { fg = colors.blue }
  highlights.PreProc = { fg = colors.blue }
  highlights.PreCondit = { fg = colors.blue }
  highlights.Define = { fg = colors.blue }
  highlights.Macro = { fg = colors.blue_light }
  highlights.Label = { fg = colors.blue }

  -- TREESITTER HIGHLIGHTS
  -- Modern semantic highlighting preserving warm/cool principle

  -- Warm tones for control and action
  highlights["@keyword"] = { link = "Keyword" }
  highlights["@keyword.conditional"] = { fg = colors.purple, bold = true }
  highlights["@keyword.repeat"] = { fg = colors.purple, bold = true }
  highlights["@keyword.return"] = { fg = colors.magenta, bold = true }
  highlights["@keyword.function"] = { fg = colors.purple }
  highlights["@keyword.operator"] = { fg = colors.purple_light }
  highlights["@keyword.exception"] = { fg = colors.purple, bold = true }

  highlights["@function"] = { link = "Function" }
  highlights["@function.call"] = { fg = colors.magenta }
  highlights["@function.method"] = { fg = colors.magenta }
  highlights["@function.method.call"] = { fg = colors.magenta }
  highlights["@function.builtin"] = { fg = colors.magenta_light }
  highlights["@function.macro"] = { fg = colors.blue_light }

  highlights["@variable"] = { link = "Variable" }
  highlights["@variable.parameter"] = { fg = colors.orange_light }
  highlights["@variable.member"] = { fg = colors.orange }
  highlights["@variable.builtin"] = { fg = colors.orange_dark }
  highlights["@property"] = { fg = colors.orange }
  highlights["@field"] = { fg = colors.orange }

  highlights["@constant"] = { link = "Constant" }
  highlights["@constant.builtin"] = { fg = colors.orange_dark }
  highlights["@constant.macro"] = { fg = colors.orange_dark }
  highlights["@number"] = { link = "Number" }
  highlights["@number.float"] = { link = "Float" }
  highlights["@boolean"] = { link = "Boolean" }

  -- Cool tones for data and structure
  highlights["@string"] = { link = "String" }
  highlights["@string.regex"] = { fg = colors.green_dark }
  highlights["@string.escape"] = { fg = colors.green_light }
  highlights["@string.special"] = { fg = colors.green_light }
  highlights["@character"] = { link = "Character" }
  highlights["@character.special"] = { fg = colors.green_light }

  highlights["@type"] = { link = "Type" }
  highlights["@type.builtin"] = { fg = colors.cyan_light }
  highlights["@type.definition"] = { fg = colors.cyan_dark }
  highlights["@type.qualifier"] = { fg = colors.cyan }
  highlights["@constructor"] = { fg = colors.cyan_dark, bold = true }
  highlights["@module"] = { fg = colors.cyan }
  highlights["@namespace"] = { fg = colors.cyan }

  highlights["@comment"] = { link = "Comment" }
  highlights["@comment.documentation"] = { fg = colors.fg_dark, italic = true }
  highlights["@comment.error"] = { fg = colors.red, bold = true }
  highlights["@comment.warning"] = { fg = colors.yellow, bold = true }
  highlights["@comment.todo"] = { link = "Todo" }
  highlights["@comment.note"] = { link = "Note" }

  highlights["@operator"] = { link = "Operator" }
  highlights["@punctuation.delimiter"] = { link = "Delimiter" }
  highlights["@punctuation.bracket"] = { fg = colors.fg_dark }
  highlights["@punctuation.special"] = { fg = colors.blue }

  -- Language-specific highlights
  highlights["@symbol.elixir"] = { fg = colors.green_dark }
  highlights["@attribute.rust"] = { fg = colors.blue }
  highlights["@label.rust"] = { fg = colors.blue }

  -- Markup (Markdown, etc.)
  highlights["@markup.heading"] = { fg = colors.purple, bold = true }
  highlights["@markup.heading.1"] = { fg = colors.purple, bold = true }
  highlights["@markup.heading.2"] = { fg = colors.magenta, bold = true }
  highlights["@markup.heading.3"] = { fg = colors.cyan, bold = true }
  highlights["@markup.strong"] = { fg = colors.magenta, bold = true }
  highlights["@markup.italic"] = { fg = colors.orange, italic = true }
  highlights["@markup.strikethrough"] = { strikethrough = true }
  highlights["@markup.underline"] = { underline = true }
  highlights["@markup.link"] = { fg = colors.blue, underline = true }
  highlights["@markup.link.url"] = { fg = colors.blue_light, underline = true }
  highlights["@markup.raw"] = { fg = colors.green }
  highlights["@markup.raw.block"] = { fg = colors.green }
  highlights["@markup.list"] = { fg = colors.purple_light }
  highlights["@markup.list.checked"] = { fg = colors.green }
  highlights["@markup.list.unchecked"] = { fg = colors.orange }

  -- DIAGNOSTICS
  highlights.DiagnosticError = { fg = colors.red }
  highlights.DiagnosticWarn = { fg = colors.yellow }
  highlights.DiagnosticInfo = { fg = colors.info }
  highlights.DiagnosticHint = { fg = colors.hint }
  highlights.DiagnosticOk = { fg = colors.green }

  highlights.DiagnosticUnderlineError = { undercurl = true, sp = colors.red }
  highlights.DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow }
  highlights.DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info }
  highlights.DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint }
  highlights.DiagnosticUnderlineOk = { undercurl = true, sp = colors.green }

  highlights.DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none }
  highlights.DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.none }
  highlights.DiagnosticVirtualTextInfo = { fg = colors.info, bg = colors.none }
  highlights.DiagnosticVirtualTextHint = { fg = colors.hint, bg = colors.none }

  -- LSP HIGHLIGHTS
  highlights.LspReferenceText = { bg = colors.selection }
  highlights.LspReferenceRead = { bg = colors.selection }
  highlights.LspReferenceWrite = { bg = colors.selection }
  highlights.LspSignatureActiveParameter = { fg = colors.orange, bold = true }
  highlights.LspCodeLens = { fg = colors.fg_gutter }
  highlights.LspCodeLensSeparator = { fg = colors.border }

  -- GIT SIGNS
  highlights.GitSignsAdd = { fg = colors.git_add }
  highlights.GitSignsChange = { fg = colors.git_change }
  highlights.GitSignsDelete = { fg = colors.git_delete }
  highlights.GitSignsAddNr = { fg = colors.git_add }
  highlights.GitSignsChangeNr = { fg = colors.git_change }
  highlights.GitSignsDeleteNr = { fg = colors.git_delete }
  highlights.GitSignsAddLn = { bg = colors.diff_add }
  highlights.GitSignsChangeLn = { bg = colors.diff_change }
  highlights.GitSignsDeleteLn = { bg = colors.diff_delete }

  return highlights
end

return M
