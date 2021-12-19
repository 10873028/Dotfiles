vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>luafile %<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
