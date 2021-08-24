local status, lspconfig = pcall(require, "lspconfig")
if not status then return end
local on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true}
    local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    buf_set_keymap("n", "<Leader>r", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<Leader>d", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> FormatWrite]])
    vim.api.nvim_command([[augroup END]])
    client.resolved_capabilities.document_formatting = false
end

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    },
    handlers = {
        [ "textDocument/publishDiagnostics" ] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = true
        })
    }
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    handlers = {
        [ "textDocument/publishDiagnostics" ] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = true
        })
    }
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    handlers = {
        [ "textDocument/publishDiagnostics" ] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = true
        })
    }
})

lspconfig.omnisharp.setup({
    on_attach = on_attach,
    cmd = {"omnisharp", "--languageserver", tostring(vim.fn.getpid())},
    handlers = {
        [ "textDocument/publishDiagnostics" ] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = true
        })
    }
})
