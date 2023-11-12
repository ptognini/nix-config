local telescope_builtin = require("telescope.builtin")

local silent_opts = { silent = true }
vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files, silent_opts)
vim.keymap.set("n", "<Leader>b", telescope_builtin.buffers, silent_opts)
vim.keymap.set("n", "<Leader>fg", telescope_builtin.live_grep, silent_opts)
vim.keymap.set("n", "<Leader>ch", telescope_builtin.command_history, silent_opts)
vim.keymap.set("n", "<Leader>ma", telescope_builtin.man_pages, silent_opts)
vim.keymap.set("n", "<Leader>ft", telescope_builtin.treesitter, silent_opts)
vim.keymap.set("n", "<Leader>fd", telescope_builtin.diagnostics, silent_opts)
vim.keymap.set("n", "<Leader>fws", telescope_builtin.lsp_workspace_symbols, silent_opts)
vim.keymap.set("n", "<Leader>fds", telescope_builtin.lsp_document_symbols, silent_opts)
vim.keymap.set("n", "<Leader>fb", telescope_builtin.current_buffer_fuzzy_find, silent_opts)
vim.keymap.set("n", "<Leader>fr", telescope_builtin.resume, silent_opts)

vim.keymap.set("n", "<Leader>fj", telescope_builtin.jumplist, silent_opts)
vim.keymap.set("n", "<Leader>fl", telescope_builtin.loclist, silent_opts)
vim.keymap.set("n", "<Leader>fs", telescope_builtin.spell_suggest, silent_opts)
