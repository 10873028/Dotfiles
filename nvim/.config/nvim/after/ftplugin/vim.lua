if vim.fn.executable("nvim") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>source %<CR>", {noremap = true, silent = true})
end
vim.api.nvim_buf_set_option(0, "commentstring", "\" %s")
