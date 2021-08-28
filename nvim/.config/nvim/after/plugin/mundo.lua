local status = vim.fn.exists("g:loaded_mundo") == 1
checkhealth.mundo = status
if not status then return end

vim.api.nvim_set_keymap("n", "<F6>", "<Cmd>MundoToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_var("mundo_width", 24)
vim.api.nvim_set_var("mundo_preview_bottom", 1)
