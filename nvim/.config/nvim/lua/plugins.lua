local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packet_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.api.nvim_command([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("folke/tokyonight.nvim")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("jose-elias-alvarez/buftabline.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("mbbill/undotree")
    use("mfussenegger/nvim-dap")
    use("mhartington/formatter.nvim")
    use("neovim/nvim-lspconfig")
    use("nvim-lua/plenary.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-telescope/telescope.nvim")
    use("rafamadriz/friendly-snippets")
    use("terrortylor/nvim-comment")
    use("tpope/vim-fugitive")
    use("wbthomason/packer.nvim")
    use("windwp/nvim-autopairs")
    use({"Shougo/defx.nvim", run = ":UpdateRemotePlugins"})
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

    if packet_bootstrap then
        require("packer").sync()
    end
end)
