"My vimrc config :)

" General configuration {
    " fish is not POSIX compatible, which is problematic for vim...
    if &shell =~# 'fish$'
        set shell=sh
    endif

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
            set listchars=tab:,.,trail:.

            autocmd FileType javascript setlocal nolist listchars=trail:.
            autocmd FileType dockerfile setlocal nolist listchars=trail:.
            autocmd FileType go setlocal nolist listchars=trail:.
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4

        autocmd FileType dockerfile setlocal noexpandtab
        autocmd FileType cucumber   setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType less       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType go         setlocal noexpandtab tabstop=8 shiftwidth=8
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

        function! SetVdebugIdeKey(ide_key)
            if !exists('g:vdebug_options')
                let g:vdebug_options = {}
            endif

            let g:vdebug_options["ide_key"] = a:ide_key
        endfunction

        function! SetVdebugDockerPath(docker_path, local_path)
            if !exists('g:vdebug_options')
                let g:vdebug_options = {}
            endif

            if !has_key(g:vdebug_options, "path_maps")
                let g:vdebug_options["path_maps"] = {}
            endif

            let g:vdebug_options["path_maps"][a:docker_path] = a:local_path
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
        let g:airline#extensions#tabline#enabled = 1
        " let g:airline#extensions#tabline#show_buffers = 1
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
        let NERDTreeShowLineNumbers=0
        let NERDTreeShowHidden=1

    " } Ctags {
        set tags=./tags,~/.vimtags,./.git/tags;$HOME

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

        " let g:vdebug_options["break_on_open"] = 0
        let g:vdebug_options["watch_window_height"]=45
        let g:vdebug_options["status_window_height"]=5
        " let g:vdebug_options["continuous_mode"]=1

        if !exists('g:vdebug_features')
            let g:vdebug_features = {}
        endif

        "let g:vdebug_features["max_data"] = 2048
        "let g:vdebug_features["max_depth"] = 100
        let g:vdebug_features["max_children"] = 128

        " <leader> + b : breakpoint window
        nnoremap <silent> <leader>b :BreakpointWindow<CR>

    " } Riv.vim {
        let g:riv_disable_folding = 1
    " } Ack.vim {
        let g:ackprg = 'rg --vimgrep --smart-case'

        cnoreabbrev rg Ack
        cnoreabbrev rG Ack
        cnoreabbrev Rg Ack
        cnoreabbrev RG Ack
    " } completion {
        "autocmd FileType php setlocal omnifunc=phpactor#Complete

        nmap <Leader>pu :call phpactor#UseAdd()<CR>
        nmap <Leader>pe :call phpactor#ClassExpand()<CR>
        nmap <Leader>pp :call phpactor#ContextMenu()<CR>
        nmap <Leader>po :call phpactor#GotoDefinition()<CR>
        nmap <Leader>pt :call phpactor#Transform()<CR>
        nmap <Leader>pcn :call phpactor#ClassNew()<CR>
        nmap <Leader>pfr :call phpactor#FindReferences()<CR>
        vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
    " } Ale {
        let g:ale_echo_msg_format = '%linter% %s'
    " }
" } Map {
    " shift+tab = unindent
    inoremap <S-TAB> <C-D>

    " Moving in files and between tabs & buffers {
        " between buffers
        nnoremap <silent> <S-Left> :bprev<CR>
        nnoremap <silent> <S-Right> :bnext<CR>
        nnoremap <silent> <S-Up> <NOP>
        nnoremap <silent> <S-Down> <NOP>

        nnoremap <silent> <M-h> :bprev<CR>
        nnoremap <silent> <M-l> :bnext<CR>
        nnoremap <silent> <M-j> <NOP>
        nnoremap <silent> <M-k> <NOP>

        " between windows
        nnoremap <silent> <C-J> :wincmd j<CR>
        nnoremap <silent> <C-K> :wincmd k<CR>
        nnoremap <silent> <C-L> :wincmd l<CR>
        nnoremap <silent> <C-H> :wincmd h<CR>

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

    " map home / end keys
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    nnoremap <Del> <NOP>
" }

