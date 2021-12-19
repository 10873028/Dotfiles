function _G._surround_single_quote()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("<Esc>`>o'<Esc>`<O'<Esc>") or _t("<Esc>`>a'<Esc>`<i'<Esc>")
end

function _G._surround_double_quote()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t('<Esc>`>o"<Esc>`<O"<Esc>') or _t('<Esc>`>a"<Esc>`<i"<Esc>')
end

function _G._surround_round_bracket()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("<Esc>`>o)<Esc>`<O(<Esc>") or _t("<Esc>`>a)<Esc>`<i(<Esc>")
end

function _G._surround_curly_bracket()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("<Esc>`>o}<Esc>`<O{<Esc>") or _t("<Esc>`>a}<Esc>`<i{<Esc>")
end

function _G._surround_square_bracket()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("<Esc>`>o]<Esc>`<O[<Esc>") or _t("<Esc>`>a]<Esc>`<i[<Esc>")
end

function _G._surround_angle_bracket()
    return vim.api.nvim_get_mode()["mode"] == "V" and _t("<Esc>`>o><Esc>`<O<<Esc>") or _t("<Esc>`>a><Esc>`<i<<Esc>")
end

vim.api.nvim_set_keymap("x", "'", "v:lua._surround_single_quote()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("x", '"', "v:lua._surround_double_quote()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("x", "(", "v:lua._surround_round_bracket()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("x", "[", "v:lua._surround_square_bracket()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("x", "{", "v:lua._surround_curly_bracket()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("x", "<", "v:lua._surround_angle_bracket()", {noremap = true, silent = true, expr = true})
