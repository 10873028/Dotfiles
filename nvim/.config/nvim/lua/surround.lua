function _G._surround(front, back)
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("c"..front.."<CR>"..back.."<Esc>P") or _t("c"..front..back.."<Esc>P") end

vim.api.nvim_set_keymap("x", "'", "v:lua._surround(\"\\'\", \"\\'\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("x", "\"", "v:lua._surround(\"\\\"\", \"\\\"\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("x", "(", "v:lua._surround(\"\\(\", \"\\)\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("x", "[", "v:lua._surround(\"\\[\", \"\\]\")", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("x", "{", "v:lua._surround(\"\\{\", \"\\}\")", { noremap = true, silent = true, expr = true })
