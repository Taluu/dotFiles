lualine = require("lualine")

lualine.setup({
    options = {
        theme = "powerline_dark",
        disabled_filetypes = {
            statusline={"NvimTree", "tagbar"},
        },
    },
})

return lualine
