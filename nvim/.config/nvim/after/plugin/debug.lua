if vim.fn.executable("gdb") == 0 then return end

vim.api.nvim_command([[packadd termdebug]])
vim.api.nvim_set_var("termdebug_wide", 1)
