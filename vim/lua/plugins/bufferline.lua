return {{
  'akinsho/bufferline.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  init = function()
    vim.opt.termguicolors = true
  end,
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
        },
        {
          filetype = "tagbar",
          text = "Tag Explorer",
          separator = true -- use a "true" to enable the default, or set your own character
        },
      },
    },
  },
}}
