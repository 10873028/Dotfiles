if vim.fn.exists("g:loaded_fugitive") == 0 then return end

function _G._smart_left() return vim.o.diff and _t("<Cmd>diffget //2<CR>") or _t("<Left>") end
function _G._smart_right() return vim.o.diff and _t("<Cmd>diffget //3<CR>") or _t("<Right>") end

vim.api.nvim_set_keymap("n", "<Left>", "v:lua._smart_left()", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("n", "<Right>", "v:lua._smart_right()", {noremap = true, silent = true, expr = true})
