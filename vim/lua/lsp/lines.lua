tiny_inline_diagnostic = require 'tiny-inline-diagnostic'

tiny_inline_diagnostic.setup({
    preset = "powerline"
})

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
})

return tiny_inline_diagnostic
