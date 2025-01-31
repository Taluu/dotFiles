-- plugins that do not require particular config
return {
  -- everyday thingies
  { 'wincent/ferret' },
  { 'mbbill/undotree' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-fugitive' },
  { 'lewis6991/gitsigns.nvim', config = function() require("gitsigns").setup() end },

  -- prog related stuff
  { 'preservim/tagbar' },
  { 'puremourning/vimspector' },

  -- cucumber
  { 'tpope/vim-cucumber' },
  { 'quentindecock/vim-cucumber-align-pipes', lazy = true },

  -- other languages
  { 'pearofducks/ansible-vim' },
}
