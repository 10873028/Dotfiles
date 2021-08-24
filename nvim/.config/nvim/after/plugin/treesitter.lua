local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

treesitter.setup({
    ensure_installed = {"bash", "vim", "c", "cpp", "c_sharp", "lua", "python", "rust"},
    highlight = {enable = true},
    incremental_selection = {enable = false},
    indent = {enable = false}
})
