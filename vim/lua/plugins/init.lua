-- My vim plugins config
-- this is using packer.nvim : https://github.com/wbthomason/packer.nvim

-- automatic installation of packer.nvim if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    -- General
    use 'wincent/ferret'
    use 'tomtom/tlib_vim'
    use 'mbbill/undotree'
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use 'vim-airline/vim-airline'
    use 'editorconfig/editorconfig-vim'
    use 'altercation/vim-colors-solarized'
    use 'https://bitbucket.org/cmthornton/vim-dist-ext.git'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- fzf
    use {
        'junegunn/fzf.vim',
        requires = {
            {
                'junegunn/fzf',
                run = './install --bin && ln -sf $(pwd) ~/.fzf'
            }
        }
    }

    -- Nerdtree
    use 'preservim/nerdtree'
    use 'jistr/vim-nerdtree-tabs'
    use 'Xuyuanp/nerdtree-git-plugin'

    -- Prog
    use 'dense-analysis/ale'
    use 'preservim/tagbar'
    use 'mhinz/vim-signify'
    use 'puremourning/vimspector'
    use 'preservim/nerdcommenter'
    use 'stephenmckinney/vim-autotag'
    use { 'neoclide/coc.nvim', run = 'yarn install --lock-file' }

    -- cucumber
    use 'tpope/vim-cucumber'
    use { 'quentindecock/vim-cucumber-align-pipes', opt = true }

    -- Other Languages
    use 'fatih/vim-go'
    use 'Rykka/riv.vim'
    use 'fpob/nette.vim'
    use 'cespare/vim-toml'
    use 'tpope/vim-markdown'
    use 'rust-lang/rust.vim'
    use 'nelsyeung/twig.vim'
    use 'pearofducks/ansible-vim'
    use { 'phpactor/phpactor',  run = 'composer install --no-dev --no-interaction', opt = true}

    if packer_bootstrap then
      require('packer').sync()
    end
end)
