# HeathGlass.nvim

A semantically intelligent Neovim colorscheme that follows the principle: **"Control flow should use warm colors and data should use cold colors"**.

Inspired by and thanks to the [melange theme](https://github.com/savq/melange-nvim) by savq for the brilliant warm/cool semantic approach.

The theme aims to capture the alluring and eyegrabbing beauty of rough and rugged heathlandi, while maintaining a certain slickness for a relaxing reading experience.

## Philosophy

HeathGlass uses warm colors (lilac, mauve, peach) for control flow and actions, while cool colors (sea-green, teal, slate-blue) represent data and structure. This creates an intuitive reading flow where your eye naturally follows the logical flow through warm colors, while data and structure provide context through cool tones without competing for attention.

The semantic color distribution follows these principles:

**Warm Colors - Control & Action**
- Lilac tones for control flow keywords (`if`, `for`, `while`, `def`)
- Mauve tones for functions and methods (active elements)  
- Peach tones for variables and identifiers (things being acted upon)

**Cool Colors - Data & Structure**  
- Sea-green tones for strings and literals (data content)
- Teal tones for types and classes (structural blueprints)
- Slate-blue tones for special syntax and preprocessor directives

## Installation

### Using lazy.nvim

```lua
{
  "WillC33/heathglass.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("heathglass").setup()
  end,
}
```

### Using packer.nvim

```lua
use {
  "WillC33/heathglass.nvim",
  config = function()
    require("heathglass").setup()
  end
}
```

### Manual Installation

Clone the repository to your Neovim configuration directory:

```bash
git clone https://github.com/WillC33/heathglass.nvim ~/.config/nvim/pack/plugins/start/heathglass.nvim
```

Then add to your `init.lua`:

```lua
require("heathglass").setup()
```

## Configuration

HeathGlass comes with sensible defaults but can be customized to your preferences. The setup function accepts an optional configuration table:

```lua
require("heathglass").setup({
  transparent = false,        -- Enable transparent background
  terminal_colors = true,     -- Configure terminal colors
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = {},
  },
  on_colors = function(colors)
    -- Override or modify colors
    colors.green = "#7dd3ad"
  end,
  on_highlights = function(highlights, colors)
    -- Override or modify highlight groups
    highlights.Comment = { fg = colors.fg_gutter, italic = false }
  end,
})
```

### Transparency

For users who prefer transparent backgrounds with their terminal, enable the transparent option:

```lua
require("heathglass").setup({
  transparent = true,
})
```

This will set most background colors to `NONE`, allowing your terminal background to show through while maintaining the semantic color relationships for syntax highlighting.

### Style Customization

You can customize the styling of different syntax elements:

```lua
require("heathglass").setup({
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = {},
  },
})
```

### Advanced Customization

For more advanced customization, use the callback functions:

```lua
require("heathglass").setup({
  on_colors = function(colors)
    -- Modify the color palette
    colors.purple = "#b794f6"
    colors.green = "#68d391"
  end,
  on_highlights = function(highlights, colors)
    -- Modify specific highlight groups
    highlights["@function"] = { fg = colors.magenta, bold = true }
  end,
})
```

## Usage

After installation, you can activate HeathGlass in several ways:

Using the setup function (recommended):
```lua
require("heathglass").setup()
```

Using the colorscheme command:
```vim
colorscheme heathglass
```

Using the load function directly:
```lua
require("heathglass").load()
```

## Features

HeathGlass provides comprehensive syntax highlighting with full TreeSitter support, LSP integration for diagnostics and semantic tokens, and compatibility with popular Neovim plugins. The theme includes terminal color configuration for consistent colors in the integrated terminal and supports both transparent and opaque background configurations.

The semantic warm/cool approach makes it particularly effective for reading complex codebases where understanding control flow and data relationships is important. The color choices are designed to reduce eye strain during long coding sessions while maintaining clear visual hierarchy.

## Language Support

HeathGlass includes optimized highlighting for many programming languages, with particular attention to modern languages like Elixir, JavaScript/TypeScript, Rust, Python, and Go. The semantic color principles apply consistently across languages, making it easier to context-switch between different codebases.

## Plugin Compatibility

The theme works out of the box with popular Neovim plugins including LSP configurations, completion engines like nvim-cmp, file explorers, fuzzy finders like Telescope, git integrations, and status line plugins. The minimal approach to plugin-specific highlights means HeathGlass will generally work well with new plugins without requiring updates.

## Credits

This theme was inspired by the [melange colorscheme](https://github.com/savq/melange-nvim) by savq, which introduced the brilliant principle of using warm colors for control flow and cool colors for data. The HeathGlass implementation builds on this foundation with a refined color palette focused on sea-green and lilac tones, creating a sophisticated and calming coding environment.

## License

MIT License - see LICENSE file for details.
