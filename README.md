# [dotfiles](https://github.com/10873028/dotfiles)

    git clone https://github.com/10873028/dotfiles.git ~/dotfiles && cd ~/dotfiles && make install

## [Arch Linux](https://archlinux.org/)

- [installation guide](https://wiki.archlinux.org/title/Installation_guide)


### Install Scripts
- [arch install base](./bin/.local/bin/arch_install_base)
- [arch install packages](./bin/.local/bin/arch_install_packages)

## [Simple Terminal](https://st.suckless.org/)

    cd ~/.config/st && sudo make clean install

### Patches

- [alpha](https://st.suckless.org/patches/alpha/) - This patch allows users to change the opacity of the background.
- [desktopentry](https://st.suckless.org/patches/desktopentry/) - Creates a desktop-entry for st.
- [font2](https://st.suckless.org/patches/font2/) - This patch allows to add spare font besides default.
- [scrollback](https://st.suckless.org/patches/scrollback/) - Scroll back through terminal output.


## [Dmenu](https://tools.suckless.org/dmenu/)

    cd ~/.config/dmenu && sudo make clean install

### Patches

- [fuzzyhighlight](https://tools.suckless.org/dmenu/patches/fuzzyhighlight/) - This patch make it so that fuzzy matches gets highlighted.
- [fuzzymatch](https://tools.suckless.org/dmenu/patches/fuzzymatch/) - This patch adds support for fuzzy-matching to dmenu.
- [lineheight](https://tools.suckless.org/dmenu/patches/line-height/) - The patch adds a '-h' option, which sets the minimum height of a dmenu line.

## [Neovim](https://github.com/neovim/neovim)

    nvim/
    ├─ after/
    │  ├─ ftplugin/
    │  └─ plugin/
    └─ init.lua

### Plugins

`:PackerSync`

Requires Neovim (>= 0.5)

- [buftabline.nvim](https://github.com/jose-elias-alvarez/buftabline.nvim) - A low-config, minimalistic buffer tabline Neovim plugin written in Lua.
- [formatter.nvim](https://github.com/mhartington/formatter.nvim) - A format runner for neovim, written in lua.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides for Neovim.
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs for neovim written by lua.
- [nvim-comment](https://github.com/terrortylor/nvim-comment) - A comment toggler for Neovim, written in Lua.
- [nvim-compe](https://github.com/hrsh7th/nvim-compe) - Auto completion Lua plugin for nvim.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Nvim LSP client.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer.
- [packer.nvim](https://github.com/wbthomason/packer.nvim) - A use-package inspired plugin manager for Neovim.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - All the lua functions I don't want to write twice.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time.
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A clean, dark Neovim theme written in Lua.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal.
- [vim-mundo](https://github.com/simnalamburt/vim-mundo) - Vim undo tree visualizer.
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip) - Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
- [vista.vim](https://github.com/liuchengxu/vista.vim) - Viewer & Finder for LSP symbols and tags.
