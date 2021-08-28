local status, autopairs = pcall(require, "nvim-autopairs")
checkhealth.autopairs = status
if not status then return end

autopairs.setup()
