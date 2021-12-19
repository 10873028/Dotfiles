local status, telescope = pcall(require, "telescope")
_checkhealth.telescope = status
if not status then return end

vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>a", "<Cmd>Telescope diagnostics bufnr=0<CR>", {noremap = true, silent = true})
