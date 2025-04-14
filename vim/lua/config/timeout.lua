local default_timeoutlen=300
vim.o.timeoutlen=default_timeoutlen
vim.o.ttimeoutlen=10

local augroup = vim.api.nvim_create_augroup("FastEscape", {})
vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  callback = function()
    vim.o.timeoutlen=0
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  callback = function()
    vim.o.timeoutlen=default_timeoutlen
  end,
})
