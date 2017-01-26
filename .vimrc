"My vimrc config :)

" General configuration {
    set nocompatible " fuck off vi !

    let mapleader = ','
    let g:mapleader = ','

    " Misc {
        set virtualedit=onemore
        set whichwrap=<,>,[,]
        set history=1000
        set hidden
        set spell
        syntax enable " wtf ?!
        set mouse= " remove mouse support

        set backupdir=~/.vim/backups
        set directory=~/.vim/backups

    " } Encoding {
        set encoding=utf-8
        scriptencoding utf-8

    " } undo {
        set undofile
        set undolevels=1000
        set undoreload=10000
        set undodir=~/.vim/undo

    " } searching {
        set incsearch

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
            set listchars=tab:,.,trail:.

            autocmd FileType javascript setlocal nolist listchars=trail:.
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4

        autocmd FileType cucumber   setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType less       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
    " } Formating {
        set pastetoggle=<F12>
        set nowrap
        set textwidth=0

        autocmd FileType php        autocmd BufNewFile,BufReadPre <buffer> call PhpSyntaxOverride()

        autocmd FileType php        autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType javascript autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType twig       autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType html.twig  autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType python     autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType yml        autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType xml        autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType cucumber   autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType vim        autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType yaml       autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType less       autocmd BufWritePre <buffer> call TrimSpaces()
        autocmd FileType ruby       autocmd BufWritePre <buffer> call TrimSpaces()

        function! TrimSpaces()
            " backup current position and last search
            let _s=@/
            let _l = line(".")
            let _c = col(".")

            %s/\s\+$//e

            " something happened, heh ?
            let @/=_s
            call cursor(_l, _c)
        endfunction

        function! PhpSyntaxOverride()
            hi! def link phpDocTags phpDefine
            hi! def link phpDocParam phpType
        endfunction
    " } tools {
        function! RunPHPUnitTest(filter)
            cd %:p:h
            if a:filter
                normal! T yw
                let result = system("phpunit --filter " . @" . " " . bufname("%"))
            else
                let result = system("phpunit " . bufname("%"))
            endif
            split __PHPUnit_Result__
            normal! ggdG
            setlocal buftype=nofile
            call append(0, split(result, '\v\n'))
            cd -
        endfunction

        nnoremap <leader>u :call RunPHPUnitTest(0)<cr>
        nnoremap <leader>f :call RunPHPUnitTest(1)<cr>
    " }
" } Plugin configuration {
    " load plugins
    source ~/.vimrc.bundles

    " Solarized {
        "let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        set background=dark

        colorscheme solarized

    " } statusbar {
        set laststatus=2
        set noshowmode

        "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

        let g:airline_powerline_fonts = 1
        " let g:airline#extensions#tabline#enabled = 1 " too buggy :(
        let g:airline#extensions#hunks#non_zero_only = 1

        " airline initialisation
        function! AirlineInit()
            let g:airline_section_b = airline#section#create(['branch'])
            let g:airline_section_c = airline#section#create(['%<', 'file', ' ', 'readonly', 'hunks'])
        endfunction

        autocmd VimEnter * call AirlineInit()

        set timeoutlen=500
        set ttimeoutlen=10

        augroup FastEscape
            autocmd!
            autocmd InsertEnter * set timeoutlen=0
            autocmd InsertLeave * set timeoutlen=1000
        augroup END

    " } NerdTree {
        noremap <C-n> :NERDTreeMirrorToggle<CR>
        noremap <leader>e :NERDTreeFind<CR>
        noremap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.git$', 'node_modules$', '\.tags$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeCasadeOpenSingleChildDir=1
        let NERDTreeShowLineNumbers=0
        let NERDTreeShowHidden=1

    " } Ctags {
        set tags=./tags;/,~/.vimtags,./.git/tags

    " } ctrlp {
        "nnoremap <silent> <S-r> :CtrlPMRU<CR>

        "let g:ctrlp_working_path_mode = 'ra'
        "let g:ctrlp_switch_buffer = 0
        "let g:ctrlp_use_caching = 0
        "let g:ctrlp_clear_cache_on_exit = 1

        "let g:ctrlp_custom_ignore = {
            "\ 'dir':  '\.git$'
        "\ }

        "let g:ctrlp_user_command = {
            "\ 'types': {
                "\ 1: ['.git', 'cd %s && git ls-files'],
            "\ },
            "\ 'fallback': 'ag %s -l --nocolor -g ""'
        "\ }
    " } fzf {
        nnoremap <silent> <c-p> :FZF<CR>

    " } TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

    " } UndoTree {
        nnoremap <silent> <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " } vDebug {
        if !exists('g:vdebug_options')
            let g:vdebug_options = {}
        endif

        if !exists('g:vdebug_features')
            let g:vdebug_features = {}
        endif

        " let g:vdebug_options["break_on_open"] = 0
        let g:vdebug_options["watch_window_height"]=45
        let g:vdebug_options["status_window_height"]=5
        " let g:vdebug_options["continuous_mode"]=1

        "let g:vdebug_features["max_data"] = 2048
        "let g:vdebug_features["max_depth"] = 100
        let g:vdebug_features["max_children"] = 128

        " <leader> + b : breakpoint window
        nnoremap <silent> <leader>b :BreakpointWindow<CR>

    " } Riv.vim {
        let g:riv_disable_folding = 1
    " } Ack.vim {
        let g:ackprg = 'ag --vimgrep --smart-case'

        cnoreabbrev ag Ack
        cnoreabbrev aG Ack
        cnoreabbrev Ag Ack
        cnoreabbrev AG Ack
    " }
" } Map {
    " shift+tab = unindent
    inoremap <S-TAB> <C-D>

    " Moving in files and between tabs & buffers {
        " between buffers
        nnoremap <A-J> <C-W>j<C-W>_
        nnoremap <A-K> <C-W>k<C-W>_
        nnoremap <A-L> <C-W>l<C-W>_
        nnoremap <A-H> <C-W>h<C-W>_

        nnoremap <C-J> :wincmd j<CR>
        nnoremap <C-K> :wincmd k<CR>
        nnoremap <C-L> :wincmd l<CR>
        nnoremap <C-H> :wincmd h<CR>

        " between lines
        nnoremap j gj
        nnoremap k gk

        " between tabs
        nnoremap <S-H> gT
        nnoremap <S-L> gt
        nnoremap <S-J> <NOP>
        nnoremap <S-K> <NOP>
    " }

    nnoremap Y y$
    vnoremap < <gv
    vnoremap > >gv

    " helpers
    cnoremap %% <C-R>=expand('%:h').'/'<CR>
    nnoremap <leader>ew :edit %%
    nnoremap <leader>et :tabedit %%
    nnoremap <silent> <leader>tc :tabclose<CR>

    " ???
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    nnoremap <Del> <NOP>
" }

