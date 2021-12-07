local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'plugins/completion/custom_lsp_attach'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

lsp_config.phpactor.setup{
    on_attach = custom_lsp_attach
}

lsp_config.tsserver.setup{
    on_attach = custom_lsp_attach
}

require 'plugins/completion/gopls'
