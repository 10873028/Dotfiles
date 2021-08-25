local status, telescope = pcall(require, "telescope")
if not status then return end
local actions = require("telescope.actions")

vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>lua require(\"telescope.builtin\").find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>lua require(\"telescope.builtin\").live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>lua require(\"telescope.builtin\").buffers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>lua require(\"telescope.builtin\").lsp_references()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>a", "<Cmd>lua require(\"telescope.builtin\").lsp_document_diagnostics()<CR>", {noremap = true, silent = true})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["jk"] = actions.close
            }
        }
    }
})
