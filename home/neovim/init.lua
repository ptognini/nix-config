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


-- Function to set the highlighting of the current split
-- Define the highlight groups
vim.api.nvim_command('highlight ActiveSplit ctermbg=Black guibg=#191724')

vim.api.nvim_command('highlight InactiveSplit ctermbg=Black guibg=#1d1d2e')
local function highlight_split()
  -- Get all windows in the current tab
  for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    -- Check if the window is the current window
    if win == vim.api.nvim_get_current_win() then
      -- Set the highlight for the active window
      vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:ActiveSplit,NormalNC:InactiveSplit')
    else
      -- Set the highlight for inactive windows
      vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:InactiveSplit,NormalNC:InactiveSplit')
    end
  end
end

-- Autocommands to trigger the highlight function on certain events
vim.api.nvim_create_augroup('HighlightActiveSplit', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'WinLeave', 'BufEnter' }, {
  group = 'HighlightActiveSplit',
  callback = highlight_split,
})
