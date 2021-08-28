vim.opt_local.cursorline = false
vim.opt_local.colorcolumn = ""

vim.api.nvim_buf_set_keymap(0, "n", "q", "<Cmd>q<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<Cmd>call vista#cursor#FoldOrJump()<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "l", "<Cmd>call vista#cursor#FoldOrJump()<CR>", {noremap = true, silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", "<Cmd>call vista#cursor#TogglePreview()<CR>", {noremap = true, silent = true})
