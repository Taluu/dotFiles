-- shortcuts
local null_ls = require 'null-ls'
local builtins = null_ls.builtins
local code_actions = builtins.code_actions
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,

        --diagnostics.buf,
        diagnostics.checkmake,
        --diagnostics.gitlint,
        diagnostics.php,
        diagnostics.phpcs,
        diagnostics.phpstan,
        diagnostics.psalm,
        diagnostics.staticcheck,
        -- diagnostics.yamllint,
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
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

return null_ls
