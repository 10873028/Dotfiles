local status, indentline = pcall(require, "indent_blankline")
checkhealth.indentline = status
if not status then return end

indentline.setup({
    char_highlight_list = {"LineNR"},
    filetype_exclude = {"help", "term", "defx", "fugitive", "packer", "markdown"}
})
