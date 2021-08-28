local status, treesitter = pcall(require, "nvim-treesitter.configs")
checkhealth.treesitter = status
if not status then return end

treesitter.setup({
    ensure_installed = {"bash", "vim", "c", "cpp", "lua", "python", "rust"},
    highlight = {enable = true},
    incremental_selection = {enable = false},
    indent = {enable = false}
})
