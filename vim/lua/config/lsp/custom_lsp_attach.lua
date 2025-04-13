return function(client, bufnr)
  local noremap = { noremap = true, buffer = bufnr, }
  local silent_noremap = vim.tbl_deep_extend('force', noremap, { silent = true })

  -- definitons navigation stuff
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, silent_noremap)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, noremap)

  -- actions stuff
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, noremap)
  vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, noremap)
  vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, noremap)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, noremap)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, noremap)

  -- diagnostics
  vim.keymap.set('n', '<leader>gp', function() vim.diagnostic.jump({count = -1}) end, noremap)
  vim.keymap.set('n', '<leader>gn', function() vim.diagnostic.jump({count =1}) end, noremap)

  -- let none-ls take over
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- completion
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end
end
