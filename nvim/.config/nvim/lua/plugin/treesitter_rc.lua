local status, treesitter = pcall(require, "nvim-treesitter.configs")
_checkhealth.treesitter = status
if not status then return end

treesitter.setup({
    ensure_installed = {"bash", "c", "cpp", "lua", "python"},
    highlight = {enable = true},
    incremental_selection = {enable = false},
    indent = {enable = false}
})
