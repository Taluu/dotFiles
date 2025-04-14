return {{
  'lifepillar/vim-solarized8',
  branch = 'neovim',
  priority=1000,
  config = function()
    vim.o.background = 'dark'
    vim.o.cursorline = true
    vim.g.solarized_t_Co=256

    vim.cmd.colorscheme("solarized8")
    vim.api.nvim_set_hl(0, "SpecialKey", {})
    vim.api.nvim_set_hl(0, "SpecialKey", {bold=true, ctermfg=12})
    vim.api.nvim_set_hl(0, "SignColumn", {link="LineNr"})
  end,
}}
