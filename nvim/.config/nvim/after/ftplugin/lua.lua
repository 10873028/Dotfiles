if vim.fn.executable("nvim") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>luafile %<CR>", {noremap = true, silent = true})
end

vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
