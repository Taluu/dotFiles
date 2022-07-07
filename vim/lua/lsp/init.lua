local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'lsp/custom_lsp_attach'
local capabilities = require 'lsp/capabilities'
require 'lsp/cmp'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

-- lsp configuration

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
                test = true,
                generate = true,
                gc_details = true,
            },
        },
    },
}


-- autocommands

local LSPGrp = vim.api.nvim_create_augroup("LSPGrp", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        desc = "Auto-format the code",
        pattern = {"*.go"},
        group = LSPGrp,
        callback = vim.lsp.buf.formatting,
    }
)
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        desc = "Organize go imports section",
        pattern = {"*.go"},
        group = LSPGrp,
        callback = function ()
            local clients = vim.lsp.buf_get_clients()
            for _, client in pairs(clients) do
                local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
                params.context = {only = {"source.organizeImports"}}

                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
                for _, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
                        else
                            vim.lsp.buf.execute_command(r.command)
                        end
                    end
                end
            end
        end,
    }
)

require('lspfuzzy').setup {}