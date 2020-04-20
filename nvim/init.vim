"My vimrc config :)

" General configuration {
    " fish is not POSIX compatible, which is problematic for vim...
    if &shell =~# 'fish$'
        set shell=sh
    endif

    let mapleader = ','
    let g:mapleader = ','

    augroup mine
    augroup END

    " Misc {
        set virtualedit=onemore
        set whichwrap=<,>,[,]
        set history=1000
        set hidden
        "set spell
        syntax enable " wtf ?!
        set mouse= " remove mouse support

        set backupdir=~/.config/nvim/backups
        set directory=~/.config/nvim/backups
    " } Encoding {
        set encoding=utf-8
        scriptencoding utf-8
    " } undo {
        set undofile
        set undolevels=1000
        set undoreload=10000
        set undodir=~/.config/nvim/undo
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

            autocmd mine FileType javascript setlocal nolist listchars=trail:.
            autocmd mine FileType dockerfile setlocal nolist listchars=trail:.
            autocmd mine FileType make setlocal nolist listchars=trail:.
            autocmd mine FileType go setlocal nolist listchars=trail:.
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4

        autocmd mine FileType dockerfile setlocal noexpandtab
        autocmd mine FileType make       setlocal noexpandtab
        autocmd mine FileType build      setlocal noexpandtab
        autocmd mine FileType neon       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType cucumber   setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType less       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType toml       setlocal shiftwidth=2 tabstop=2 softtabstop=2
        autocmd mine FileType go         setlocal noexpandtab  tabstop=8 shiftwidth=8
    " } Formating {
        set pastetoggle=<F12>
        set nowrap
        set textwidth=0

        function! PhpSyntaxOverride()
            hi! def link phpDocTags phpDefine
            hi! def link phpDocParam phpType
        endfunction
    " } debug+remote {
        function! SetVdebugIdeKey(ide_key)
            if !exists('g:vdebug_options')
                let g:vdebug_options = {}
            endif

            let g:vdebug_options['ide_key'] = a:ide_key
        endfunction

        function! SetVdebugDockerPath(docker_path, local_path)
            if !exists('g:vdebug_options')
                let g:vdebug_options = {}
            endif

            if !has_key(g:vdebug_options, 'path_maps')
                let g:vdebug_options['path_maps'] = {}
            endif

            let g:vdebug_options['path_maps'][a:docker_path] = a:local_path
        endfunction
    " }
" } Plugin configuration {
    source ~/.config/nvim/plugins.vim

    " Solarized {
        "let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        set background=dark

        colorscheme solarized
    " } Signify {
        hi! link SignColumn LineNr
    " } statusbar {
        set laststatus=2
        set noshowmode

        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        " let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#hunks#non_zero_only = 1

        " airline initialisation
        function! AirlineInit()
        endfunction

        autocmd * VimEnter * call AirlineInit()

        set timeoutlen=500
        set ttimeoutlen=10

        augroup FastEscape
            autocmd!
            autocmd InsertEnter * set timeoutlen=0
            autocmd InsertLeave * set timeoutlen=1000
        augroup END
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
    " } Ctags {
        set tags=./tags,~/.vimtags,./.git/tags;$HOME
    " } fzf {
        nnoremap <silent> <C-P> :FZF<CR>
        nnoremap <silent> <S-P> :Commands<CR>
    " } TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " } UndoTree {
        nnoremap <silent> <Leader>u :UndotreeToggle<CR>
        let g:undotree_SetFocusWhenToggle=1
    " } vDebug {
        if !exists('g:vdebug_options')
            let g:vdebug_options = {}
        endif

        " let g:vdebug_options['break_on_open'] = 0
        " let g:vdebug_options['continuous_mode']=1

        let g:vdebug_options['layout'] = 'horizontal'

        if !exists('g:vdebug_features')
            let g:vdebug_features = {}
        endif

        "let g:vdebug_features["max_data"] = 2048
        "let g:vdebug_features["max_depth"] = 100
        let g:vdebug_features['max_children'] = 128

        " <leader> + b : breakpoint window
        nnoremap <silent> <leader>b :BreakpointWindow<CR>
    " } Riv.vim {
        let g:riv_disable_folding = 1
    " } Ack.vim {
        let g:ackprg = 'rg --vimgrep --smart-case'
    " } completion {
        set completeopt=noinsert,menuone,noselect,preview

        set shortmess+=c

        " With COC.nvim
        nmap <silent> <leader>gd <Plug>(coc-definition)
        nmap <silent> <leader>gi <Plug>(coc-implementation)
        nmap <silent> <leader>gr <Plug>(coc-references)
        nmap <silent> <leader>h :call CocAction('doHover')<CR>

        augroup rust
            au!
        augroup END
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

            au FileType php nmap <silent> <Leader>pu :PhpactorImportClass<CR>
            au FileType php nmap <silent> <Leader>pt :PhpactorTransform<CR>
            au FileType php nmap <silent> <Leader>pce :PhpactorClassExpand<CR>
            au FileType php nmap <silent> <Leader>pcm :PhpactorContextMenu<CR>
            au FileType php nmap <silent> <Leader>pgd :PhpactorGotoDefinition<CR>
            au FileType php nmap <silent> <Leader>pfr :PhpactorFindReferences<CR>
        augroup END
    " }
" } Map {
    " shift+tab = unindent
    inoremap <S-TAB> <C-D>

    " Moving in files and between tabs & buffers {
        " between buffers
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

    " map home / end keys
    map [F $
    map [H g0

    nnoremap <Del> <NOP>
" }
