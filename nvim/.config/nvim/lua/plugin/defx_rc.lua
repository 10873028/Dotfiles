local status = vim.fn.exists("g:loaded_defx") == 1
_checkhealth.defx = status
if not status then return end

function _G._defx_bs()
    return vim.fn["defx#do_action"]("multi", {{"cd", ".."}, "change_vim_cwd"})
end

function _G._defx_cr()
    if vim.fn["defx#is_directory"]() then
        return vim.fn["defx#do_action"]("multi", {"open_directory", "change_vim_cwd"})
    else
        return vim.fn["defx#do_action"]("open")
    end
end

function _G._defx_l()
    if vim.fn["defx#is_directory"]() then
        return vim.fn["defx#do_action"]("open_or_close_tree")
    else
        return vim.fn["defx#do_action"]("open")
    end
end

vim.fn["defx#custom#column"]("mark", vim.api.nvim_eval("{'readonly_icon': '✗', 'selected_icon': '✓'}"))
vim.fn["defx#custom#option"]("_", vim.api.nvim_eval("{'columns': 'indent:indent:indent:indent:mark:filename', 'resume': 1, 'show_ignored_files': 1}"))

vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>Defx<CR>", {noremap = true, silent = true})
