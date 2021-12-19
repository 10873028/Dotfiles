local status, formatter = pcall(require, "formatter")
_checkhealth.formatter = status
if not status then return end

formatter.setup({
    logging = false,
    filetype = {
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style='{BasedOnStyle: Microsoft, ColumnLimit: 0, AccessModifierOffset: -4, PointerAlignment: Left, AlwaysBreakTemplateDeclarations: true, NamespaceIndentation: All, SortIncludes: false}'",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true
                }
            end
        },
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style='{BasedOnStyle: Microsoft, ColumnLimit: 0, AccessModifierOffset: -4, PointerAlignment: Left, AlwaysBreakTemplateDeclarations: true, NamespaceIndentation: All, SortIncludes: false}'",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {
                    exe = "black",
                    args = {"-"},
                    stdin = true
                }
            end
        }
    }
})
