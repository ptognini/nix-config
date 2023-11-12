vim.g.codelens_enabled = true;
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
require ("ibl").setup(
  {
    enabled = true,
    debounce = 100,
    indent = { char = "▏" },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = {
      highlight = {"RainbowBlue", "RainbowRed",},
      enabled = true,
      char = "▏",
      show_start = true,
      show_end = true,
    },
  }
)

local hooks = require "ibl.hooks"
hooks.register(hooks.type.SCOPE_HIGHLIGHT, function(_, _, scope, _)
    if scope:type() == "if_statement" then
        return 2
    end
    return 1
end)

require("colorizer").setup(
  {
    user_default_options = {
      AARRGGBB = true;
    }
  }
)
