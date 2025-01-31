local silent_noremap = { silent = true, remap = false }
local noremap = { remap = false }

-- between buffers
vim.keymap.set('n', '<M-h>', ':bprev<CR>', silent_noremap)
vim.keymap.set('n', '<M-l>', ':bnext<CR>', silent_noremap)
vim.keymap.set('n', '<M-j>', '<NOP>', silent_noremap)
vim.keymap.set('n', '<M-k>', '<NOP>', silent_noremap)

-- between windows
vim.keymap.set('n', '<C-H>', ':wincmd h<CR>', silent_noremap)
vim.keymap.set('n', '<C-J>', ':wincmd j<CR>', silent_noremap)
vim.keymap.set('n', '<C-K>', ':wincmd k<CR>', silent_noremap)
vim.keymap.set('n', '<C-L>', ':wincmd l<CR>', silent_noremap)

-- between lines
vim.keymap.set('n', 'j', 'gj', noremap)
vim.keymap.set('n', 'k', 'gk', noremap)

-- between tabs
vim.keymap.set('n', '<S-H>', 'gT', noremap)
vim.keymap.set('n', '<S-L>', 'gt', noremap)
vim.keymap.set('n', '<S-J>', '<NOP>', noremap)
vim.keymap.set('n', '<S-K>', '<NOP>', noremap)

vim.keymap.set('v', '<', '<gv', noremap)
vim.keymap.set('v', '>', '>gv', noremap)

-- map home / end keys
vim.keymap.set('', '[F', '$', {})
vim.keymap.set('', '[H', 'g0', {})

vim.keymap.set('', '<Del>', '<NOP>', noremap)
