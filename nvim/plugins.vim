" My plugins
"
" This is using vim-plug (https://github.com/junegunn/vim-plug)

" Automatic installation of vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Utils {
    Plug 'tomtom/tlib_vim'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

" } General {
    Plug 'scrooloose/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    Plug 'Rykka/riv.vim', { 'for': 'rst' }
    Plug 'https://bitbucket.org/cmthornton/vim-dist-ext.git'
    Plug 'dag/vim-fish'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'b4b4r07/vim-ansible-vault'

" } Prog {
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'stephenmckinney/vim-autotag'
    Plug 'airblade/vim-gitgutter'
    "Plug 'vim-vdebug/vdebug' " commented out until we can redesign the thing properly... see https://github.com/vim-vdebug/vdebug/issues/360
    Plug 'taluu/vdebug', { 'branch': 'redesign' }
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
    Plug 'StanAngeloff/php.vim', { 'for': 'php' }
    Plug 'scrooloose/nerdtree-git-plugin'
    Plug 'fatih/vim-go'

    " Completion stuff {
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'

        " PHP {
            Plug 'phpactor/phpactor',  {'do': 'composer install --no-dev', 'for': 'php', 'branch': 'develop'}
            Plug 'roxma/ncm2-phpactor'
        " }
    " } Misc {
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
        Plug 'quentindecock/vim-cucumber-align-pipes', { 'for': 'cucumber' }
        Plug 'nelsyeung/twig.vim'
    " }
" }

call plug#end()

