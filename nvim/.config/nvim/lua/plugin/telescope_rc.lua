local status, telescope = pcall(require, "telescope")
_checkhealth.telescope = status
if not status then return end

telescope.setup({
    defaults = {
        history = false,
        mappings = {
            n = {
                ["q"] = require("telescope.actions").close
            }
        }
    }
})

vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>a", "<Cmd>lua require('telescope.builtin').diagnostics()<CR>", {noremap = true, silent = true})
