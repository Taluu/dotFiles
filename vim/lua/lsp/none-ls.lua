-- shortcuts
local none_ls = require 'null-ls'
local builtins = none_ls.builtins
local code_actions = builtins.code_actions
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,

        diagnostics.checkmake,
        diagnostics.phpcs,
        diagnostics.phpstan,
        diagnostics.zsh,

        formatting.goimports,
        formatting.gofmt,
        formatting.phpcsfixer,
    },

    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            -- apply whatever logic you want (in this example, we'll only use null-ls)
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end
})

return none_ls
