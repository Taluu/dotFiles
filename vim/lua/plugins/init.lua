-- plugins that do not require particular config
return {
  -- everyday thingies
  { 'wincent/ferret' },
  {
    'mbbill/undotree',
    init = function()
      vim.o.undodir = vim.fn.stdpath('data') .. "/undo"
      vim.g.undotree_SetFocusWhenToggle=1
    end,
    keys = {
      { "<Leader>u", ":UndotreeToggle<CR>", mode = "n" },
    },
  },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- prog related stuff
  {
    'preservim/tagbar',
    init = function()
      vim.opt.tags = {"./tags", vim.fn.stdpath('data') .. "/tags", "./.git/tags"}
      vim.g.tagbar_position = 'rightbelow vertical'
    end,
    keys = {
      { "<leader>tt", ":TagbarToggle<CR>", mode = "n", silent = true},
    },
  },
  {
    'puremourning/vimspector',
    init = function()
      vim.g.vimspector_enable_mappings = 'HUMAN'
      vim.g.vimspector_base_dir = vim.fn.stdpath('data') .. '/vimspector'
      vim.g.vimspector_install_gadgets = {'vscode-go', 'CodeLLDB', 'vscode-php-debug'}
    end,
  },

  -- cucumber
  { 'tpope/vim-cucumber' },
  { 'quentindecock/vim-cucumber-align-pipes', lazy = true },

  -- other languages
  { 'pearofducks/ansible-vim' },
}
