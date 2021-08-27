if vim.fn.executable("gdb") == 0 then return end

function _G.termdebug()
    local executable = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    if vim.fn.executable(executable) == 0 then return end
    vim.api.nvim_set_var("termdebug_wide", 1)
    vim.api.nvim_command([[packadd termdebug]])
    vim.api.nvim_command("Termdebug "..executable)
end

vim.api.nvim_set_keymap("n", "<F10>", "<Cmd>lua termdebug()<CR>", {noremap = true, silent = true})
