local status, buftabline = pcall(require, "buftabline")
if not status then return end

buftabline.setup({
    tab_format = " #{n}:[#{b}]#{f} ",
    disable_commands = true,
    go_to_maps = false
})

for i = 0, 9 do
    vim.api.nvim_set_keymap("n", "<Leader>"..i, "<Cmd>lua require(\"buftabline.commands\").buftarget("..i..", \"buffer\")<CR>", { noremap = true, silent = true })
end
