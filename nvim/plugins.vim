" My plugins
"
" This is using vim-packager (https://github.com/kristijanhusak/vim-packager)

" Automatic installation of vim-packager
if !isdirectory('~/.config/nvim/pack/packager/opt/vim-packager')
    silent !git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
    autocmd mine VimEnter * PackagerInstall
endif

function! PackagerInit() abort
    packadd vim-packager
    call packager#init()
    call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

    " General
    call packager#add('wincent/ferret')
    call packager#add('tomtom/tlib_vim')
    call packager#add('mbbill/undotree')
    call packager#add('tpope/vim-repeat')
    call packager#add('tpope/vim-abolish')
    call packager#add('tpope/vim-fugitive')
    call packager#add('vim-airline/vim-airline')
    call packager#add('editorconfig/editorconfig-vim')
    call packager#add('altercation/vim-colors-solarized')
    call packager#add('https://bitbucket.org/cmthornton/vim-dist-ext.git')

    " fzf
    call packager#add('junegunn/fzf', { 'do': './install --bin && ln -sf $(pwd) ~/.fzf'})
    call packager#add('junegunn/fzf.vim')

    " Nerdtree
    call packager#add('preservim/nerdtree')
    call packager#add('jistr/vim-nerdtree-tabs')
    call packager#add('Xuyuanp/nerdtree-git-plugin')

    " Prog
    call packager#add('dense-analysis/ale')
    call packager#add('majutsushi/tagbar')
    call packager#add('mhinz/vim-signify')
    call packager#add('vim-vdebug/vdebug')
    call packager#add('preservim/nerdcommenter')
    call packager#add('stephenmckinney/vim-autotag')
    call packager#add('neoclide/coc.nvim', { 'do': 'yarn install --lock-file' })

    " PHP
    call packager#add('StanAngeloff/php.vim')
    call packager#add('phpactor/phpactor',  {'do': 'composer install --no-dev --no-interaction', 'type': 'opt', 'branch': 'develop'})

    " cucumber
    call packager#add('tpope/vim-cucumber')
    call packager#add('quentindecock/vim-cucumber-align-pipes', { 'type': 'opt' })

    " Other Languages
    call packager#add('dag/vim-fish')
    call packager#add('Rykka/riv.vim')
    call packager#add('fpob/nette.vim')
    call packager#add('cespare/vim-toml')
    call packager#add('tpope/vim-markdown')
    call packager#add('rust-lang/rust.vim')
    call packager#add('nelsyeung/twig.vim')
    call packager#add('pearofducks/ansible-vim')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

augroup packager_filetype
    autocmd!

    autocmd FileType php packadd phpactor
    autocmd FileType cucumber vim-cucumber-align-pipes
augroup END
