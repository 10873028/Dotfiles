local status, buftabline = pcall(require, "buftabline")
_checkhealth.buftabline = status
if not status then return end

buftabline.setup({
    tab_format = " #{n}:[#{b}]#{f} ",
    buffer_id_index = false,
    icon_colors = false,
    start_hidden = false,
    auto_hide = false,
    disable_commands = true,
    go_to_maps = true,
    flags = {
        modified = "[+]",
        not_modifiable = "[-]",
        readonly = "[RO]",
    },
    hlgroups = {
        current = "TabLineSel",
        normal = "TabLine",
        active = nil,
        spacing = nil,
        modified_current = nil,
        modified_normal = nil,
        modified_active = nil,
    }
})
