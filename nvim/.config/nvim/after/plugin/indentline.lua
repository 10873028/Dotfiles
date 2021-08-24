local status, indentline = pcall(require, "indent_blankline")
if not status then return end

indentline.setup({
    char = " ",
    space_char = " ",
    show_trailing_blankline_indent = false,
    char_highlight_list = { "", "ColorColumn" },
    space_char_highlight_list = { "", "ColorColumn" },
    filetype_exclude = { "help", "term" }
})
