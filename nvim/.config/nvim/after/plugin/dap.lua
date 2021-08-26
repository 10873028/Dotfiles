local status, dap = pcall(require, "dap")
if not status then return end

vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "MoreMsg"})
vim.fn.sign_define("DapStopped", {text = "", texthl = "ErrorMsg"})
vim.fn.sign_define("DapLogPoint", {text = "", texthl = "WarningMsg"})
vim.fn.sign_define("DapBreakpointRejected", {text = "", texthl = "ErrorMsg"})

dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
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

dap.adapters.debugpy = {
    type = "executable",
    command = "python",
    args = {"-m", "debugpy.adapter"}
}

dap.configurations.python = {
    {
        name = "Debug",
        type = "debugpy",
        request = "launch",
        program = "${file}",
        pythonPath = "python"
    }
}
