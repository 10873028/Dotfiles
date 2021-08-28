if vim.fn.exists("g:loaded_vista") == 0 then return end

vim.api.nvim_set_var("vista_default_executive", "nvim_lsp")
vim.api.nvim_set_var("vista#renderer#enable_icon", 0)
vim.api.nvim_set_var("vista_icon_indent", {"▶ ", ""})
vim.api.nvim_set_var("vista_disable_statusline", 0)
vim.api.nvim_set_var("vista_echo_cursor", 0)
vim.api.nvim_set_var("vista_no_mappings", 1)
vim.api.nvim_set_keymap("n", "<F4>", "<Cmd>Vista!!<CR>", {noremap = true, silent = true})
