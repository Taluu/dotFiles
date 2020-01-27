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
    Plug 'wincent/ferret'
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
    Plug 'https://bitbucket.org/cmthornton/vim-dist-ext.git'
    Plug 'editorconfig/editorconfig-vim'
" } Prog {
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'stephenmckinney/vim-autotag'
    Plug 'mhinz/vim-signify'
    Plug 'vim-vdebug/vdebug'
    Plug 'scrooloose/nerdtree-git-plugin'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " PHP {
        Plug 'StanAngeloff/php.vim', { 'for': 'php' }
        Plug 'phpactor/phpactor',  {'do': 'composer install --no-dev', 'for': 'php', 'branch': 'develop'}
    " } Rust {
        Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    " } Other Languages {
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
        Plug 'quentindecock/vim-cucumber-align-pipes', { 'for': 'cucumber' }
        Plug 'nelsyeung/twig.vim'
        Plug 'fpob/nette.vim'
        Plug 'pearofducks/ansible-vim'
        Plug 'dag/vim-fish'
        Plug 'Rykka/riv.vim', { 'for': 'rst' }
    " }
" }

call plug#end()
