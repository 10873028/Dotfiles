if vim.fn.exists("g:loaded_defx") == 0 then return end

function _G._is_directory()
    if vim.fn["defx#is_directory"]() then
        return vim.fn["defx#do_action"]("open_or_close_tree")
    else
        return vim.fn["defx#do_action"]("multi", {"drop" , "quit"})
    end
end

vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>Defx -toggle -resume -winwidth=30 -direction=topleft -split=vertical -show-ignored-files -columns=indent:filename<CR>", {noremap = true, silent = true})
