if vim.fn.executable("python") == 1 then
    vim.api.nvim_buf_set_keymap(0, "n", "<F9>", "<Cmd>!time python %<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "x", "<F9>", "<Esc><Cmd>'<,'>w !time python<CR>", {noremap = true, silent = true})
    dap()
end

vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
