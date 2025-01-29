return {{
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  keys = {
    {"<C-\\>", function() require("fzf-lua").buffers() end},
    {"<C-M-k>", function() require"fzf-lua".builtin() end},
    {"<C-p>", function() require"fzf-lua".files() end},
    {"<C-M-l>", function() require"fzf-lua".live_grep_glob() end},
    {"<C-g>", function() require"fzf-lua".grep_project() end},
    {"<F1>", function() require"fzf-lua".help_tags() end},
  },
  opts = {"telescope"},
}}
