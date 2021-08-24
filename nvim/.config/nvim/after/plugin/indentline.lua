local status, indentline = pcall(require, "indent_blankline")
if not status then return end

indentline.setup({
    show_first_indent_level = false,
    char_highlight_list = { "LineNR"},
    filetype_exclude = { "help", "term", "defx", "fugitive", "markdown" }
})
