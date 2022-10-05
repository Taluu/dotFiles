lsp_lines = require 'lsp_lines'
lsp_lines.setup()

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
})

return lsp_lines
