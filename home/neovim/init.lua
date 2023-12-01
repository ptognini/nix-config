vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
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
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.o.listchars = "trail:-,nbsp:+,tab:▏ "
vim.opt.list = true -- Enable displaying of 'listchars'
-- those pesky avro schema files...
vim.cmd([[
  augroup AvroSchema
    autocmd!
    autocmd BufRead,BufNewFile *.avsc set filetype=json
  augroup END
]])

-- vim.o.laststatus = 3

vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
-- neovide options
vim.o.guifont = "JetBrainsMono Nerd Font:style=Bold:h10"
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
--	vim.fn.system({
--		"git",
--		"clone",
--		"--filter=blob:none",
--		"https://github.com/folke/lazy.nvim.git",
--		"--branch=stable", -- latest stable release
--		lazypath,
--	})
--end
require("lazy").setup({
	{"nvim-lua/plenary.nvim"},
	ConfigureTheme(),
	Telescope(),
	ConfigureMiniStarter(),
	Treesitter(),
	Animate(),
	Lsp(),
	Completion(),
	Illuminate(),
	Trouble(),
	Persistence(),
	Statusline(),
	Notify(),
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "christoomey/vim-tmux-navigator", lazy = false},
	Noice(),
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	"folke/which-key.nvim",
	{
		"L3MON4D3/LuaSnip",
		build = (not jit.os:find("Windows"))
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

--require("auto-session").setup({
--  auto_session_use_git_branch = true,
--  auto_restore_enabled = true,
--  auto_session_enabled = true,
--})
--
