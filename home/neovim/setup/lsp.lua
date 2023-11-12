local lsp_zero_config = {
  call_servers = 'global',
}

local lsp_servers = {
  'lua_ls',
  'gopls',
  'nixd',
  'bashls'
}

local lsp_settings = {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      runtime = { version = 'LuaJIT' },
      telemetry = { enable = false },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    },
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = true,
        fieldalignment = true,
        nilness = true,
        shadow = true,
        unusedvariable = true,
      },
      experimentalPostfixCompletions = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "fuzzy",
      diagnosticsDelay = '500ms',
      gofumpt = true
    }
  },
}

local lsp_zero = require('lsp-zero')

local navic = require('nvim-navic')


lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- lsp_zero.default_keymaps({buffer = bufnr, preserve_mappings = false})
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end)

lsp_zero.set_preferences(lsp_zero_config)
lsp_zero.configure('lua_ls', lsp_settings)
lsp_zero.configure('gopls', lsp_settings)
lsp_zero.setup_servers(lsp_servers)
lsp_zero.setup()

require('nvim-autopairs').setup(
  {
    check_ts = true,
    fast_wrap = {
      map = "<M-e>",
      offset = 0,
    }
  }
)

local lsp_kind_opts = {
  mode = "symbol",
  symbol_map = {
    Array = "󰅪",
    Boolean = "⊨",
    Class = "󰌗",
    Constructor = "",
    Key = "󰌆",
    Namespace = "󰅪",
    Null = "NULL",
    Number = "#",
    Object = "󰀚",
    Package = "󰏗",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "󰀬",
    TypeParameter = "󰊄",
    Unit = "",
  },
}

local luasnip = require("luasnip")

local cmp = require('cmp')

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local border_opts = {
  border = "single",
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'nvim_lua', priority = 800 },
    { name = 'luasnip',  priority = 750 },
    { name = 'buffer',   priority = 500 },
    { name = 'path',     priority = 250 },
    { name = 'command',  priority = 100 },
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  window = {
    completion = cmp.config.window.bordered(border_opts),
    documentation = cmp.config.window.bordered(border_opts),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = require('lspkind').cmp_format(lsp_kind_opts)
  },
  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    cmp_tabnine = 1,
    buffer = 1,
    path = 1,
  },
})

vim.diagnostic.config {
  underline = true,
  virtual_text = {
    prefix = "",
    severity = nil,
    source = "if_many",
    format = nil,
  },
  signs = true,
  severity_sort = true,
  update_in_insert = true,
}
