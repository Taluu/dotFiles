return function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = true }
    local noremap = { noremap = true }

    -- definitons navigation stuff
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', noremap)

    -- workspace related stuff
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', noremap)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', noremap)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>', noremap)

    -- actions stuff
    buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap)
    buf_set_keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.references()<CR>', noremap)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', noremap)
    buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.refactor()<CR>', noremap)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', noremap)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', noremap)

    -- diagnostics
    buf_set_keymap('n', '<leader>gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', noremap)
    buf_set_keymap('n', '<leader>gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', noremap)

    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- add code lens support ?
    if client.supports_method("textDocument/codeLens") then
        buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)

        vim.api.nvim_create_autocmd("CursorHold,CursorHoldI,InsertLeave", {
            callback = vim.lsp.codelens.refresh,
        })
    end

    -- let null-ls take over
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end
