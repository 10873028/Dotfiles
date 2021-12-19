vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>source %<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_option(0, "commentstring", '" %s')
