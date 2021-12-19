local status, lualine = pcall(require, "lualine")
_checkhealth.lualine = status
if not status then return end

lualine.setup({
    options = {
        icons_enabled = false,
        theme = "tokyonight",
        section_separators = {"", ""},
        component_separators = {"", ""}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {
            {"filename", path = 1}
        },
        lualine_x = {
            {
                "diagnostics",
                sources = {"nvim_diagnostic"},
                symbols = {error = " ", warn = " ", info = " ", hint = " "},
                update_in_insert = true
            }
        },
        lualine_y = {"filetype"},
        lualine_z = {"location"}
    }
})
