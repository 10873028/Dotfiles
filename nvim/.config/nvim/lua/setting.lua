vim.opt.syntax = "enable"
vim.opt.termguicolors = true
vim.opt.wildoptions = "pum"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.mouse = "nv"
vim.opt.pumheight = 10
vim.opt.pumblend = 25
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.history = 100
vim.opt.updatetime = 1000
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12
vim.opt.laststatus = 2
vim.opt.completeopt = "menuone,noselect"
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("c")
vim.opt.diffopt:append("vertical")
if vim.fn.executable("/usr/bin/python3") == 1 then
    vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python3") end
