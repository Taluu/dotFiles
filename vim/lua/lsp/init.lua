local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'lsp/custom_lsp_attach'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require 'lsp/cmp'
require 'lsp/lines'
require 'lsp/null-ls'
require 'lsp/fuzzy'
require 'lsp/gitsigns'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

-- lsp configuration
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
                gc_details = true,
            },
        },
    },
}

lsp_config.phpactor.setup{
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
}
