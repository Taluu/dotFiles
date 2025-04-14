-- My vimrc config :)

vim.g.mapleader = ','

vim.o.virtualedit= "onemore"
vim.o.whichwrap="<,>,[,]"
vim.o.incsearch=true
vim.o.history=1000
vim.o.hidden=true
vim.o.mouse=""

vim.o.backupdir=vim.fn.stdpath("data") .. '/backups'
vim.o.directory=vim.fn.stdpath("data") .. '/swaps'

-- ui
vim.o.number=true
vim.o.wildmenu=true
vim.o.foldenable=false

-- undo
if vim.fn.has('persistent_undo') then
  vim.o.undofile=true
  vim.o.undolevels=1000
  vim.o.undoreload=10000
  vim.o.undodir=vim.fn.stdpath("data") .. '/undo'
end

vim.diagnostic.config({
  virtual_lines = { current_line = true },
})

require 'config.lazy'
require 'config.movement'
require 'config.formatting'
require 'config.timeout'
