local status = vim.fn.exists("g:loaded_undotree") == 1
_checkhealth.undotree = status
if not status then return end

vim.api.nvim_set_var("undotree_SplitWidth", 24)
vim.api.nvim_set_keymap("n", "<F6>", "<Cmd>UndotreeToggle<CR>", {noremap = true, silent = true})
