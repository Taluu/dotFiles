local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'completion/custom_lsp_attach'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

lsp_config.phpactor.setup{
    on_attach = custom_lsp_attach
}

lsp_config.tsserver.setup{
    on_attach = custom_lsp_attach
}

-- copied from gopls config : https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lsp_config.gopls.setup {
    cmd = {"gopls", "serve"},
    on_attach = custom_lsp_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

require('lspfuzzy').setup {}
