if vim.fn.executable("clang") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>!clang -g %<CR>", { noremap = true, silent = true })
end
vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
