local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'completion/custom_lsp_attach'
local capabilities = require 'completion/capabilities'

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

local goPLSGrp = vim.api.nvim_create_augroup("GoPLS", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        desc = "Auto-format the code",
        pattern = {"*.go"},
        group = goPLSGrp,
        callback = function ()
            vim.lsp.buf.formatting()
        end,
    }
)
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        desc = "Organize go imports section",
        pattern = {"*.go"},
        group = goPLSGrp,
        callback = function ()
            local params = vim.lsp.util.make_range_params()
            params.context = {only = {"source.organizeImports"}}
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)

            for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
                    else
                        vim.lsp.buf.execute_command(r.command)
                    end
                end
            end
        end,
    }
)
