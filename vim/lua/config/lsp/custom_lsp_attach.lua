return function(client, bufnr)
  local noremap = { noremap = true, buffer = bufnr, }
  local silent_noremap = vim.tbl_deep_extend('force', noremap, { silent = true })

  -- definitons navigation stuff
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, silent_noremap)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, noremap)

  -- actions stuff
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, noremap)
  vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, noremap)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, noremap)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, noremap)

  -- diagnostics
  vim.keymap.set('n', '<leader>gp', function() vim.diagnostic.jump({count = -1}) end, noremap)
  vim.keymap.set('n', '<leader>gn', function() vim.diagnostic.jump({count =1}) end, noremap)

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf=bufnr})

  -- let none-ls take over
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end
