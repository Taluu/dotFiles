local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'completion/custom_lsp_attach'
require 'completion/cmp'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_config.phpactor.setup{
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
}

lsp_config.tsserver.setup{
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
}

-- copied from gopls config : https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lsp_config.gopls.setup {
    cmd = {"gopls", "serve"},
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                useany = true,
            },
            staticcheck = true,
            codelenses = {
                generate = true,
                test = true,
            },
        },
    },
}

require('lspfuzzy').setup {}
