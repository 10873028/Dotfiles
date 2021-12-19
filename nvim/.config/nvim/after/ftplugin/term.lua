vim.opt_local.scrolloff = 0
vim.opt_local.sidescrolloff = 0
vim.opt_local.number = false
vim.opt_local.relativenumber = false

vim.api.nvim_buf_set_keymap(0, "t", "<F7>", "<Cmd>lua sp_term()<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_keymap(0, "t", "<F8>", "<Cmd>lua float_term()<CR>", {noremap = true, silent = true})
