if vim.fn.exists("g:loaded_defx") == 0 then return end

vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>Defx -toggle -winwidth=30 -direction=topleft -split=vertical -resume -columns=indent:filename<CR>", { noremap = true, silent = true })
