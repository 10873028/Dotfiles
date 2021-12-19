local status, autopairs = pcall(require, "nvim-autopairs")
_checkhealth.autopairs = status
if not status then return end

autopairs.setup()
