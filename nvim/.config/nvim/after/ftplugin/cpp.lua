if vim.fn.executable("g++") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>!time g++ -g3 %<CR>", {noremap = true, silent = true})
end

if vim.fn.executable("gdb") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F10>", "<Cmd>lua termdebug()<CR>", {noremap = true, silent = true})
end

vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
