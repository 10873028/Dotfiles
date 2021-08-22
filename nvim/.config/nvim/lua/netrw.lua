vim.api.nvim_set_var("netrw_dirhistmax", 0)
vim.api.nvim_set_var("netrw_banner", 0)
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>Explore<CR>", { noremap = true, silent = true })
