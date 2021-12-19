local status, dap = pcall(require, "dap")
_checkhealth.dap = status
if not status then return end

dap.adapters.debugpy = {
    type = "executable",
    command = "python",
    args = {"-m", "debugpy.adapter"}
}

dap.configurations.python = {
    {
      name = "Launch",
      type = 'debugpy',
      request = 'launch',
      program = "${file}",
    },
}

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd().."/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false
    }
}

dap.configurations.c = dap.configurations.cpp

function _G.dap()
    vim.api.nvim_buf_set_keymap(0, "n", "<F10>", "<Cmd>lua require('dap').continue()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>q", "<Cmd>lua require('dap').repl.toggle({}, 'vsplit')<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>w", "<Cmd>lua local widgets = require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>b", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>B", "<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>s", "<Cmd>lua require('dap').step_into()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>n", "<Cmd>lua require('dap').step_over()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>o", "<Cmd>lua require('dap').step_out()<CR>", {noremap = true, silent = true})
end

vim.fn.sign_define("DapBreakpoint", {text = "⬤", texthl = "DiagnosticError", numhl = "DiagnosticError"})
vim.fn.sign_define("DapStopped", {text = "", texthl = "DiagnosticHint", numhl = "DiagnosticHint", linehl = "CursorLine"})
vim.fn.sign_define("DapBreakpointCondition", {text = "⬤", texthl = "DiagnosticWarn", numhl = "DiagnosticWarn"})
vim.fn.sign_define("DapLogPoint", {text = "", texthl = "DiagnosticInfo", numhl = "DiagnosticInfo"})
vim.fn.sign_define("DapBreakpointRejected", {text = "", texthl = "DiagnosticError", numhl = "DiagnosticError"})
