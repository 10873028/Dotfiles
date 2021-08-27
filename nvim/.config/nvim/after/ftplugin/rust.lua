if vim.fn.executable("rustc") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>!time rustc -g %<CR>", {noremap = true, silent = true})
end

if vim.fn.executable("rust-gdb") == 1 then
    vim.api.nvim_set_var("termdebugger", "rust-gdb")
    vim.api.nvim_buf_set_keymap(0, "n", "<F10>", "<Cmd>lua termdebug()<CR>", {noremap = true, silent = true})
end

vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
