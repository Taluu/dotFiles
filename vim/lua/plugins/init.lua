-- plugins that do not require particular config
return {
  -- everyday thingies
  { 'wincent/ferret' },
  { 'tomtom/tlib_vim' },
  { 'mbbill/undotree' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-abolish' },
  {
    'shumphrey/fugitive-gitlab.vim',
    dependencies = {
        {'tpope/vim-fugitive'},
    },
  },
  { 'https://bitbucket.org/cmthornton/vim-dist-ext.git' },
  { 'lewis6991/gitsigns.nvim', config = function() require("gitsigns").setup() end },

  -- prog related stuff
  { 'preservim/tagbar' },
  { 'puremourning/vimspector' },
  { 'stephenmckinney/vim-autotag' },

  -- cucumber
  { 'tpope/vim-cucumber' },
  { 'quentindecock/vim-cucumber-align-pipes', lazy = true },

  -- other languages
  { 'Rykka/riv.vim' },
  { 'fpob/nette.vim' },
  { 'cespare/vim-toml' },
  { 'tpope/vim-markdown' },
  { 'rust-lang/rust.vim' },
  { 'nelsyeung/twig.vim' },
  { 'pearofducks/ansible-vim' },
  { 'phpactor/phpactor',  ft="php", build = 'composer install --no-dev --no-interaction --prefer-dist', lazy = true },
}
