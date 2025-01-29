return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    opts = {
      options = {
        theme = "powerline_dark",
        disabled_filetypes = {
          statusline={"NvimTree", "tagbar"},
        },
      },
    },
  },
}
