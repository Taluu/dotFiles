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
    use 'wbthomason/packer.nvim'

    -- General
    use 'wincent/ferret'
    use 'tomtom/tlib_vim'
    use 'mbbill/undotree'
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'
    use {
        'shumphrey/fugitive-gitlab.vim',
        requires = {
            {'tpope/vim-fugitive'}
        }
    }
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
    use 'preservim/tagbar'
    use 'mhinz/vim-signify'
    use 'puremourning/vimspector'
    use 'preservim/nerdcommenter'
    use 'stephenmckinney/vim-autotag'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        requires = {
            {'neovim/nvim-lspconfig'},
        },
    }
    use {
      'ojroques/nvim-lspfuzzy',
      requires = {
        {'junegunn/fzf'},
        {'junegunn/fzf.vim'},
      },
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
        },
    }

    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
            {'hrsh7th/cmp-path'},
            {
                'hrsh7th/cmp-cmdline',
                requires = {
                    {'hrsh7th/cmp-buffer'},
                },
            },
            {
                'saadparwaiz1/cmp_luasnip',
                requires = {
                    {'L3MON4D3/LuaSnip'},
                },
            },
        }
    }

    -- cucumber
    use 'tpope/vim-cucumber'
    use { 'quentindecock/vim-cucumber-align-pipes', opt = true }

    -- Other Languages
    -- use 'fatih/vim-go'
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
