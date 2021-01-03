"My vimrc config :)

" General configuration {
    " fish is not POSIX compatible, which is problematic for vim...
    if &shell =~# 'fish$'
        set shell=sh
    endif

    let mapleader = ','
    let g:mapleader = ','
    let g:loaded_python_provider = 0

    if has('nvim')
        let path_to_config = expand('$HOME/.config/nvim')
    else
        let path_to_config = expand('$HOME/.vim')
    endif

    augroup mine
        autocmd!
    augroup END

    " Misc {
        set virtualedit=onemore
        set whichwrap=<,>,[,]
        set history=1000
        set hidden
        "set spell
        syntax enable " wtf ?!
        set mouse= " remove mouse support

        " vim specific settings
        if !has('nvim')
            set nocompatible
            set clipboard=unnamedplus
            set signcolumn=number " @todo move this once nvim 0.5 has been released
        endif

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
    " } debug+remote {
        let g:vimspector_enable_mappings = 'HUMAN'
        let g:vimspector_base_dir = path_to_config . '/vimspector-config'
        let g:vimspector_install_gadgets = [ 'vscode-go', 'CodeLLDB', 'vscode-php-debug' ]
    " }
" } Plugin configuration {
    source $HOME/dotfiles/vim/plugins.vim

    " Solarized {
        let g:solarized_termtrans=1
        set background=dark

        colorscheme solarized
        highlight clear SpecialKey
        highligh SpecialKey cterm=bold ctermfg=12
        set cursorline

        " Remove this on nvim 0.5 (use signcolumn=number instead)
        if has('nvim')
            hi! link SignColumn LineNr
        endif
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
        nmap <silent> <leader>e :NERDTreeFind<CR>
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

        " Because meta-keys are funky on vim... let's register these only on
        " nvim
        if has('nvim')
            nnoremap <silent> <C-M-P> :Commands<CR>
            inoremap <expr> <C-M-F> fzf#vim#complete#path('rg --files')
        endif
    " } TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " } UndoTree {
        nnoremap <silent> <Leader>u :UndotreeToggle<CR>
        let g:undotree_SetFocusWhenToggle=1
    " } Riv.vim {
        let g:riv_disable_folding = 1
    " } Ack.vim {
        let g:ackprg = 'rg --vimgrep --smart-case'
    " } Coc.nvim {
        let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-yaml',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-xml',
            \ 'coc-phpactor',
            \ 'coc-go',
        \ ]
    " } completion {
        set completeopt=noinsert,menuone,noselect,preview
        set shortmess+=c

        " With COC.nvim
        nmap <silent> <leader>gd <Plug>(coc-definition)
        nmap <silent> <leader>gi <Plug>(coc-implementation)
        nmap <silent> <leader>gr <Plug>(coc-references)
        nmap <silent> <leader>h :call CocAction('doHover')<CR>
    " } Ale {
        let g:ale_echo_msg_format = '[%linter% : %severity%] %s'
        let g:ale_php_phpcs_standard = 'PSR12'

        let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
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
            au FileType php nmap <silent> <Leader>pgd :PhpactorGotoDefinition<CR>
            au FileType php nmap <silent> <Leader>pfr :PhpactorFindReferences<CR>
        augroup END
    " }
" } Map {
    " Moving in files and between tabs & buffers {
        " between buffers
        " (differences between vim and nvim : meta fucking keys)
        if has('nvim')
            nmap <silent> <M-h> :bprev<CR>
            nmap <silent> <M-l> :bnext<CR>
            nnoremap <silent> <M-j> <NOP>
            nnoremap <silent> <M-k> <NOP>
        else
            nmap <silent> h :bprev<CR>
            nmap <silent> l :bnext<CR>
            nnoremap <silent> j <NOP>
            nnoremap <silent> k <NOP>
        endif

        " between windows
        nnoremap <silent> <C-H> :wincmd h<CR>
        nnoremap <silent> <C-J> :wincmd j<CR>
        nnoremap <silent> <C-K> :wincmd k<CR>
        nnoremap <silent> <C-L> :wincmd l<CR>

        " between lines
        nnoremap j gj
        nnoremap k gk

        " between tabs
        nnoremap <S-H> gT
        nnoremap <S-L> gt
        nnoremap <S-J> <NOP>
        nnoremap <S-K> <NOP>
    " }

    vnoremap < <gv
    vnoremap > >gv

    " map home / end keys
    map [F $
    map [H g0

    nnoremap <Del> <NOP>
" }
