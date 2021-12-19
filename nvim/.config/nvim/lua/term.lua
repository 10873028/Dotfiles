function _G.float_term()
    local bufnr = vim.fn.bufnr("term://*")
    local bufwinnr = vim.fn.bufwinnr("term://*")
    local ui = vim.api.nvim_list_uis()[1]
    local height = 20
    local width = 80
    if bufwinnr > 0 then
        vim.api.nvim_command(bufwinnr.."wincmd w | q")
    elseif bufnr > 0 then
        vim.api.nvim_open_win(0, true, {relative="editor", width = width, height = height, border = "single", row = (ui.height / 2) - (height / 2), col = (ui.width / 2) - (width / 2)})
        vim.api.nvim_command("buffer term://*")
    else
        vim.api.nvim_open_win(0, true, {relative="editor", width = width, height = height, border = "single", row = (ui.height / 2) - (height / 2), col = (ui.width / 2) - (width / 2)})
        vim.api.nvim_command("terminal")
    end
end

function _G.vs_term()
    local bufnr = vim.fn.bufnr("term://*")
    local bufwinnr = vim.fn.bufwinnr("term://*")
    if bufwinnr > 0 then
        vim.api.nvim_command(bufwinnr.."wincmd w | q")
    elseif bufnr > 0 then
        vim.api.nvim_command("vertical split | buffer term://*")
    else
        vim.api.nvim_command("vertical split | terminal")
    end
end

function _G.sp_term()
    local bufnr = vim.fn.bufnr("term://*")
    local bufwinnr = vim.fn.bufwinnr("term://*")
    if bufwinnr > 0 then
        vim.api.nvim_command(bufwinnr.."wincmd w | q")
    elseif bufnr > 0 then
        vim.api.nvim_command("split | buffer term://*")
        vim.api.nvim_command("resize 5")
    else
        vim.api.nvim_command("split | terminal")
        vim.api.nvim_command("resize 5")
    end
end

vim.api.nvim_set_keymap("n", "<F7>", "<Cmd>lua sp_term()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F8>", "<Cmd>lua float_term()<CR>", {noremap = true, silent = true})
vim.api.nvim_command([[autocmd TermOpen term://* set filetype=term]])
