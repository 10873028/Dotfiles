vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.history = 100
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.pumblend = 25
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.syntax = "enable"
vim.opt.tabstop = 4
vim.opt.timeoutlen = 250
vim.opt.title = true
vim.opt.undofile = true
vim.opt.updatetime = 1000
vim.opt.wildoptions = "pum"
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("c")
if vim.fn.has("unix") and vim.fn.executable("/usr/bin/python3") == 1 then
    vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python3") end
vim.api.nvim_command([[augroup YankHighlight]])
vim.api.nvim_command([[autocmd!]])
vim.api.nvim_command([[autocmd TextYankPost * silent! lua require("vim.highlight").on_yank({timeout = 100})]])
vim.api.nvim_command([[augroup END]])
