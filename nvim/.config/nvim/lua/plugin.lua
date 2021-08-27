local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.api.nvim_command([[packadd packer.nvim]])
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("neovim/nvim-lspconfig")
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use("nvim-telescope/telescope.nvim")
    use("terrortylor/nvim-comment")
    use("windwp/nvim-autopairs")
    use("folke/tokyonight.nvim")
    use("tpope/vim-fugitive")
    use("simnalamburt/vim-mundo")
    use("hrsh7th/nvim-compe")
    use("hrsh7th/vim-vsnip")
    use("lukas-reineke/indent-blankline.nvim")
    use("rafamadriz/friendly-snippets")
    use("mhartington/formatter.nvim")
    use("hoob3rt/lualine.nvim")
    use("jose-elias-alvarez/buftabline.nvim")
    use({"Shougo/defx.nvim", run = ":UpdateRemotePlugins"})
end)
