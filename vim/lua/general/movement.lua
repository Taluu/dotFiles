local set_key = vim.api.nvim_set_keymap
local silent_noremap = { silent = true, noremap = true }
local noremap = { noremap = true }
local silent = { silent = true }

-- Moving in files and between tabs & buffers {
    -- between buffers
    set_key('n', '<M-h>', ':bprev<CR>', silent_noremap)
    set_key('n', '<M-l>', ':bnext<CR>', silent_noremap)
    set_key('n', '<M-j>', '<NOP>', silent_noremap)
    set_key('n', '<M-k>', '<NOP>', silent_noremap)

    -- between windows
    set_key('n', '<C-H>', ':wincmd h<CR>', silent_noremap)
    set_key('n', '<C-J>', ':wincmd j<CR>', silent_noremap)
    set_key('n', '<C-K>', ':wincmd k<CR>', silent_noremap)
    set_key('n', '<C-L>', ':wincmd l<CR>', silent_noremap)

    -- betwe'n', en lines
    set_key('n', 'j', 'gj', noremap)
    set_key('n', 'k', 'gk', noremap)

    -- betwe'n', en tabs
    set_key('n', '<S-H>', 'gT', noremap)
    set_key('n', '<S-L>', 'gt', noremap)
    set_key('n', '<S-J>', '<NOP>', noremap)
    set_key('n', '<S-K>', '<NOP>', noremap)
-- }

set_key('v', '<', '<gv', noremap)
set_key('v', '>', '>gv', noremap)

-- map home / end keys
set_key('', '[F', '$', {})
set_key('', '[H', 'g0', {})

set_key('', '<Del>', '<NOP>', noremap)
