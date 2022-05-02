"My vimrc config :)

" General configuration {
    let g:mapleader = ','
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
        set signcolumn=number

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
    " } Filetypes {
        let g:do_filetype_lua = 1
        let g:did_load_filetypes = 0
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

            " waiting for https://github.com/vim/vim/issues/5206 to be
            " resolved (aka todo item about allowin listchars to be defined
            " locally)
            "
            " Until then, when switching buffers... will need to do a `:e` or `:w`
            " In order to retrigger the FileType event :/
            "
            " Meanwhile, neovim fixed that problem, so no need to "retrigger"
            " the FileType event. Yeay !
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
        augroup END
    " } Formating {
        set pastetoggle=<F12>
        set nowrap
        set textwidth=0

        function! PhpSyntaxOverride()
            hi! def link phpDocTags phpDefine
            hi! def link phpDocParam phpType
        endfunction

        let g:PHP_noArrowMatching = 1
    " } debug+remote {
        let g:vimspector_enable_mappings = 'HUMAN'
        let g:vimspector_base_dir = path_to_config . '/vimspector'
        let g:vimspector_install_gadgets = [ 'vscode-go', 'CodeLLDB', 'vscode-php-debug' ]
    " }
" } Plugin configuration {
    lua require('plugins')
    lua require('treesitter')

    " Solarized {
        let g:solarized_termtrans=1
        set background=dark

        colorscheme solarized
        highlight clear SpecialKey
        highligh SpecialKey cterm=bold ctermfg=12
        set cursorline
    " } statusbar {
        set laststatus=2
        set noshowmode

        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_splits = 1
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#hunks#non_zero_only = 1
    " } NerdTree {
        nmap <silent> <C-n> :NERDTreeMirrorToggle<CR>
        nmap <silent> <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.git$', 'node_modules$', '\.tags$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowLineNumbers=0
        let NERDTreeShowHidden=1

        " If more than one window and previous buffer was NERDTree, go back to it.
        autocmd mine BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

        map <silent> <C-f> :NERDTreeFind<CR>
    " } Ctags {
        set tags=./tags,$HOME/.vimtags,./.git/tags;$HOME
    " } fzf {
        nnoremap <silent> <C-p> :FZF<CR>

        nnoremap <silent> <C-M-P> :Commands<CR>
        inoremap <expr> <C-M-F> fzf#vim#complete#path('rg --files')
    " } TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
        let g:tagbar_position='rightbelow vertical'
    " } UndoTree {
        nnoremap <silent> <Leader>u :UndotreeToggle<CR>
        let g:undotree_SetFocusWhenToggle=1
    " } Riv.vim {
        let g:riv_disable_folding = 1
    " } Ack.vim {
        let g:ackprg = 'rg --vimgrep --smart-case --follow'
    " } completion {
        lua require('completion')
    " } Ale {
        let g:ale_echo_msg_format = '[%linter% : %severity%] %s'
        let g:ale_php_phpcs_standard = 'PSR12'

        let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ }

        let g:ale_linters = {
        \   'go': ['govet', 'staticcheck']
        \ }

        let g:ale_fix_on_save = 1
    " } Phpactor {
        let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
        let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'

        augroup php
            au!
            au FileType php au BufNewFile,BufReadPre <buffer> call PhpSyntaxOverride()
            au FileType php set iskeyword+=$

            au FileType php nmap <silent> <Leader>pu :PhpactorImportClass<CR>
            au FileType php nmap <silent> <Leader>pt :PhpactorTransform<CR>
            au FileType php nmap <silent> <Leader>pce :PhpactorClassExpand<CR>
            au FileType php nmap <silent> <Leader>pcm :PhpactorContextMenu<CR>
        augroup END
    " }
" } Map {
    lua require('movement')
" }
