local status, tokyonight = pcall(require, "tokyonight")
_checkhealth.tokyonight = status
if not status then return end

vim.api.nvim_set_var("tokyonight_style", "night")
vim.api.nvim_set_var("tokyonight_dark_sidebar", false)
vim.api.nvim_set_var("tokyonight_dark_float", false)
vim.api.nvim_set_var("tokyonight_italic_functions", true)
vim.api.nvim_command([[colorscheme tokyonight]])
