local status, lspconfig = pcall(require, "lspconfig")
_checkhealth.lspconfig = status
if not status then return end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>r", "<Cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>d", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-j>", "<Cmd>lua vim.diagnostic.open_float(0, {scope = 'line', border = 'single'})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-j>", "<Cmd>lua vim.diagnostic.open_float(0, {scope = 'line', border = 'single'})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "==", "<Cmd>Format<CR>", {noremap = true, silent = true})
    vim.api.nvim_command([[augroup LspHighlight]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    vim.api.nvim_command([[augroup END]])
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticHint"})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {border="single"}
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {border="single"}
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true
    }
)

lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
})

lspconfig.clangd.setup({
    on_attach = on_attach
})
