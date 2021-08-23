function _G._t(...)
    return vim.api.nvim_replace_termcodes(..., true, true, true)
end
function _G._check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
function _G.dump(...)
    local objs = vim.tbl_map(vim.inspect, {...})
    print(unpack(objs))
end
