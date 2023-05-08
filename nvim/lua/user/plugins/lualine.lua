local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
    return
end

-- get lualine nightfly theme
local lualine_tokyonight = require("lualine.themes.tokyonight")

-- configure lualine with modified theme
lualine.setup({
    options = {
        theme = lualine_tokyonight,
    },
})
