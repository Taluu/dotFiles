"My vimrc config :)

" General configuration {
    let g:mapleader = ','
    let g:maplocalleader = '\\'
    let g:loaded_python_provider = 0

    let path_to_config = expand('$HOME/.config/nvim')

    augroup mine
        autocmd!
    augroup END

    " Misc {
        set virtualedit=onemore
        set whichwrap=<,>,[,]
        set history=1000
        set hidden
        "set spell
        set mouse= " remove mouse support
        set signcolumn=auto

        let &backupdir=path_to_config . '/backups'
        let &directory=path_to_config. '/backups'
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
            let &undodir=path_to_config . '/undo'
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

            augroup local_listchars
                autocmd!
                autocmd FileType * setlocal listchars=tab:│\ ,trail:.
                autocmd FileType dockerfile setlocal listchars=tab:\ \ ,trail:.
                autocmd FileType make setlocal listchars=tab:\ \ ,trail:.
                autocmd FileType go setlocal listchars=tab:\ \ ,trail:.
            augroup END
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4

        augroup mine
            autocmd FileType dockerfile setlocal noexpandtab
            autocmd FileType make       setlocal noexpandtab
            autocmd FileType build      setlocal noexpandtab
            autocmd FileType go         setlocal noexpandtab
            autocmd FileType neon       setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType cucumber   setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType less       setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd FileType toml       setlocal shiftwidth=2 tabstop=2 softtabstop=2
            autocmd Filetype lua        setlocal shiftwidth=2 tabstop=2 softtabstop=2
        augroup END
    " } Formating {
        set pastetoggle=<F12>
        set nowrap
        set textwidth=0

        function! PhpSyntaxOverride()
            hi! def link phpDocTags phpDefine
            hi! def link phpDocParam phpType
        endfunction

        augroup php
            au!
            au FileType php au BufNewFile,BufReadPre <buffer> call PhpSyntaxOverride()
            au FileType php set iskeyword+=$
        augroup END

        let g:PHP_noArrowMatching = 1
    " }
" }

" Lua stuff
lua require('config.lazy')
lua require('config.movement')
