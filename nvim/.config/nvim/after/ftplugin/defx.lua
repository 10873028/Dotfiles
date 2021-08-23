function _G._is_directory()
    if vim.fn["defx#is_directory"]() then
        return vim.fn["defx#do_action"]("open_or_close_tree")
    end
    return vim.fn["defx#do_action"]("multi", { "drop" , "quit" })
end

vim.api.nvim_buf_set_keymap(0, "n", "q", "<Cmd>q<CR>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "cr", "v:lua._is_directory()", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "l", "v:lua._is_directory()", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "yy", "defx#do_action(\"copy\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "P", "defx#do_action(\"paste\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "dd", "defx#do_action(\"move\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "O", "defx#do_action(\"new_file\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "n", "cw", "defx#do_action(\"rename\")", { noremap = true, silent = true, expr = true })
