local status, cmp = pcall(require, "cmp")
_checkhealth.cmp = status
if not status then return end

local status, luasnip = pcall(require, "luasnip")
_checkhealth.luasnip = status
if not status then return end

vim.opt.completeopt="menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
            elseif luasnip.jumpable() then
                vim.api.nvim_feedkeys(_t("<Plug>luasnip-jump-next"), "", true)
            elseif _check_back_space() then
                fallback()
            else
                cmp.complete()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
            elseif luasnip.jumpable(-1) then
                vim.api.nvim_feedkeys(_t("<Plug>luasnip-jump-prev"), "", true)
            elseif _check_back_space() then
                fallback()
            else
                cmp.complete()
            end
        end, {"i", "s"}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ["<Esc>"] = function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                fallback()
            end
        end
    },
    sources = {
        {name = "luasnip"},
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "calc"},
        {name = "path"},
        {name = "buffer", keyword_length = 5}
    },
    formatting = {
        format = function(entry, item)
            item.menu = ({
                luasnip = "[LuaSnip]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                calc = "[Calc]",
                path = "[Path]",
                buffer = "[Buffer]"
            })[entry.source.name]
            return item
        end,
    },
    documentation = {
        border = "single",
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
    }
})

require("luasnip/loaders/from_vscode").lazy_load({paths = {"~/.local/share/nvim/site/pack/packer/start/friendly-snippets"}})
