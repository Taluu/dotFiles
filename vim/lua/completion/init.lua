local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'completion/custom_lsp_attach'
local capabilities = require 'completion/capabilities'
require 'completion/cmp'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })


lsp_config.phpactor.setup{
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
}

lsp_config.tsserver.setup{
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
}

require 'completion/configs/gopls'

require('lspfuzzy').setup {}
