function ConfigureTheme()
  return {
    {
      "rose-pine/neovim",
      lazy=false,
      name="rose-pine",
      priority=1000,
      config = function()
        require('rose-pine').setup({
          bold_vert_split = false,
          dim_nc_background = false,
          disable_background = true,
          disable_float_background = true,
          disable_italics = false,
          highlight_groups = {
            Comment = { italic = true }
          }
        })
        vim.cmd([[colorscheme rose-pine ]])
      end,
    },
    {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        -- vim.cmd([[colorscheme catppuccin]])
      end,
      opts = {
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      },
    },
  }
end
