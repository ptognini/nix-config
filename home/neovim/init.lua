vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- indent related options
-- set nosmartindent
-- set cindent
-- filetype plugin indent on
-- set cinkeys-=0#
-- set indentkeys-=0#
-- autocmd FileType * set cindent "some file types override it
-- vim.opt.smartindent = true
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.preserveindent = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.g.mapleader = " "


-- those pesky avro schema files...
vim.cmd [[
  augroup AvroSchema
    autocmd!
    autocmd BufRead,BufNewFile *.avsc set filetype=json
  augroup END
]]

-- vim.o.laststatus = 3

vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
-- neovide options
vim.o.guifont = "JetBrainsMono Nerd Font:style=Bold:h10"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
require ("auto-session").setup({
  auto_session_use_git_branch = true,
  auto_restore_enabled = true,
  auto_session_enabled = true,
})


-- auto format nix files when saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.nix",
    callback = function()
        vim.cmd("undojoin | NixFmt")
    end,
})

vim.api.nvim_create_user_command("NixFmt", function()
    vim.cmd("%!nixfmt")
end, {})


