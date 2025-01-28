local set_key = vim.api.nvim_set_keymap
local silent_noremap = { silent = true, noremap = true }
local noremap = { noremap = true }

require("fzf-lua").setup({"telescope"})

set_key("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
set_key("n", "<C-M-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
set_key("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
set_key("n", "<C-M-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
set_key("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
set_key("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
