return {{
  'lifepillar/vim-solarized8',
  branch = 'neovim',
  priority=1000,
  config = function()
    require("config.colorscheme")
  end,
}}
