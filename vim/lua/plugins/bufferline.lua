local bufferline = require("bufferline")

vim.opt.termguicolors = true
bufferline.setup{
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            },
            {
                filetype = "tagbar",
                text = "Tag Explorer",
                separator = true -- use a "true" to enable the default, or set your own character
            },
        },
    },
}
