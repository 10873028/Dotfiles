if vim.fn.executable("rustc") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>!rustc %<CR>", { noremap = true, silent = true })
end
vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
