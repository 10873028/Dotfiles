vim.opt_local.scrolloff = 0
vim.opt_local.sidescrolloff = 0
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.api.nvim_buf_set_keymap(0, "n", "q", "<Cmd>q<CR>", {noremap = true, silent = true})
