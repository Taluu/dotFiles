-- setup colorscheme, use solarized dark
vim.o.background = 'dark'
vim.o.cursorline = true

vim.cmd.colorscheme("solarized8")
vim.api.nvim_set_hl(0, "SpecialKey", {})
vim.api.nvim_set_hl(0, "SpecialKey", {cterm={bold=true}, ctermfg=12})
vim.api.nvim_set_hl(0, "SignColumn", {link="LineNr"})
