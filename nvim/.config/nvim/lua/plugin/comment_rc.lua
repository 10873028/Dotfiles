local status, comment = pcall(require, "nvim_comment")
_checkhealth.comment = status
if not status then return end

comment.setup({
    marker_padding = true,
    comment_empty = true,
    create_mappings = false
})
vim.api.nvim_set_keymap("n", "<Leader>]", "<Cmd>CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<Leader>]", "<Esc><Cmd>'<,'>CommentToggle<CR>gv", {noremap = true, silent = true})
