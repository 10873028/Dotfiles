function _G.termdebug()
    local executable = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    if vim.fn.executable(executable) == 0 then return end

    vim.api.nvim_command([[packadd termdebug]])
    vim.api.nvim_set_var("termdebug_wide", 1)
    vim.api.nvim_command("Termdebug "..executable)
end
