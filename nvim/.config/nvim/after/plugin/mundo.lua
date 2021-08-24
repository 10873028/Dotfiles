if vim.fn.exists("g:loaded_mundo") == 0 then return end

vim.api.nvim_set_keymap("n", "<F6>", "<Cmd>MundoToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_var("mundo_width", 30)
vim.api.nvim_set_var("mundo_preview_bottom", 1)
