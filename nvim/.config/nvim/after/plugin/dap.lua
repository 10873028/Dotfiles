local status, dap = pcall(require, "dap")
if not status then return end

vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "Moremsg"})
vim.fn.sign_define("DapStopped", {text = "", texthl = "Errormsg"})

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Debug",
        type = "lldb",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" }
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Debug",
        program = "${file}",
        pythonPath = "python"
    }
}

vim.api.nvim_set_keymap("n", ",b", "<Cmd>lua require(\"dap\").toggle_breakpoint()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",r", "<Cmd>lua require(\"dap\").continue()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",s", "<Cmd>lua require(\"dap\").step_into()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",n", "<Cmd>lua require(\"dap\").step_over()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",f", "<Cmd>lua require(\"dap\").step_out()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",k", "<Cmd>lua require(\"dap.ui.widgets\").hover()<CR>", {noremap = true, silent = true})
