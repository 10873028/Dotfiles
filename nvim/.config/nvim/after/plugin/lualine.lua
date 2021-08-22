local status, lualine = pcall(require, "lualine")
if not status then return end

lualine.setup({
    options = {
        icons_enabled = false,
        theme = "tokyonight",
        section_separators = { " ", " " },
        component_separators = { " ", " " }
    },
    sections = {
        lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" } },
            "encoding",
            "filetype"
        }
    }
})
