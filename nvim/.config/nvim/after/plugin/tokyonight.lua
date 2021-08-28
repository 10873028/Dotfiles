local status, tokyonight = pcall(require, "tokyonight")
checkhealth.tokyonight = status
if not status then return end

vim.api.nvim_set_var("tokyonight_style", "night")
tokyonight.colorscheme()
