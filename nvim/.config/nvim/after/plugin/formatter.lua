local status, formatter = pcall(require, "formatter")
if not status then return end

formatter.setup({
    logging = false,
    filetype = {
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style=\"{BasedOnStyle: Microsoft, AccessModifierOffset: -4, PointerAlignment: Left}\"",
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
                        "--style=\"{BasedOnStyle: Microsoft, AccessModifierOffset: -4, PointerAlignment: Left}\"",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true
                }
            end
        },
        cs = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style=\"{BasedOnStyle: Microsoft, AccessModifierOffset: -4, PointerAlignment: Left}\"",
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true
                }
            end
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout" },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {
                    exe = "black",
                    args = { "-" },
                    stdin = true
                }
            end
        }
    }
})
