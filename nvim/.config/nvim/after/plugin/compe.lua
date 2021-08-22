local status, compe = pcall(require, "compe")
if not status then return end

function _G._smart_tab()
    if vim.fn.pumvisible() == 1 then
        return _t("<C-n>")
    elseif vim.fn["vsnip#jumpable"](1) == 1 then
        return _t("<Plug>(vsnip-jump-next)")
    elseif _check_back_space() then
        return _t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end

function _G._smart_s_tab()
    if vim.fn.pumvisible() == 1 then
        return _t("<C-p>")
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        return _t("<Plug>(vsnip-jump-prev)")
    else
        return _t("<S-Tab>")
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua._smart_tab()", { silent = true, expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua._smart_tab()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua._smart_s_tab()", { silent = true, expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua._smart_s_tab()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm(luaeval(\"require('nvim-autopairs').autopairs_cr()\"))", { noremap = true, silent = true, expr = true })

compe.setup({
    source = {
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = { priority = 100000 },
        path = true,
        buffer = true,
        calc = true
    }
})
