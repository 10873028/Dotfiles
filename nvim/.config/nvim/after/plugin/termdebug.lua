vim.api.nvim_command([[packadd termdebug]])
local status = vim.fn.exists("termdebugger") == 1
checkhealth.termdebug = status
if not status then return end

function _G.termdebug()
    local executable = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    if vim.fn.executable(executable) == 0 then return end
    vim.api.nvim_command("Termdebug "..executable)
end

vim.api.nvim_set_var("termdebug_wide", 1)
