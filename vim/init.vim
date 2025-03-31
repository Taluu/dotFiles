"My vimrc config :)

" General configuration {
    let g:mapleader = ','
    let g:maplocalleader = '\\'
    let g:loaded_python_provider = 0

    " Misc {
        set virtualedit=onemore
        set whichwrap=<,>,[,]
        set history=1000
        set hidden
        set mouse= " remove mouse support
        set signcolumn=auto

        let &backupdir=stdpath("data") . '/backups'
        let &directory=stdpath("data") . '/backups'
    " } Timeout presses for vim combinations
        set timeoutlen=300
        set ttimeoutlen=10

        " to exit insert mode fast
        augroup FastEscape
            autocmd!
            autocmd InsertEnter * set timeoutlen=0
            autocmd InsertLeave * set timeoutlen=300
        augroup END
    " } Encoding {
        set encoding=utf-8
        scriptencoding utf-8
    " } undo {
        if has('persistent_undo')
            set undofile
            set undolevels=1000
            set undoreload=10000
            let &undodir=stdpath("data") . '/undo'
        endif
    " } searching {
        set incsearch
        nnoremap <silent> <esc><esc> :noh<cr>
    " } ui {
        set number
        set wildmenu
        set nofoldenable
        set cursorline
        set tabpagemax=15

        set backspace=indent,eol,start

        set t_Co=256

        " list blank characters {
            set list
            set listchars=tab:│\ ,trail:.
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
    " } Formating {
        set nowrap
        set textwidth=0
    " }
" }

" Lua stuff
lua require('config.lazy')
lua require('config.movement')
