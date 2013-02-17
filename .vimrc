"My vimrc config :)

" General configuration {
    set nocompatible " fuck off vi !

    " Misc {
        set virtualedit=onemore
        set history=1000
        set spell
        set hidden
        set whichwrap=<,>,[,]

    " } Encoding {
        set encoding=utf-8
        scriptencoding utf-8

    " undo {
        set undofile
        set undodir=~/.vim/undo
        set undolevels=1000
        set undoreload=10000

    " } ui {
        set number
        set nofoldenable
        set cursorline
        set tabpagemax=15

        set backspace=indent,eol,start

        " list blank characters {
            set list
            set listchars=tab:,.,trail:.
       " }
    " } indent {
        set smartindent
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4

        autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2
    " } Formating {
        set pastetoggle=<F12>
        set nowrap
        set textwidth=0

        autocmd FileType php,javascript,twig,html.twig,python,yml,xml,cucumber,vim autocmd BufWritePre <buffer> call TrimSpaces()

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
    " }
" } Plugin configuration {
    " load plugins
    source ~/.vimrc.bundles

    " Solarized {
        "let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized

    " } Ack {
        let g:ackprg="ack-grep -H --no-color --no-group --column"

    " } powerline {
        set laststatus=2
        set noshowmode
        set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            autocmd InsertEnter * set timeoutlen=0
            autocmd InsertLeave * set timeoutlen=1000
        augroup END

    " } NerdTree {
        map <C-n> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        map <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.git']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeCasadeOpenSingleChildDir=1
        let NERDTreeShowLineNumbers=0

    " } Indentguide {
        hi IndentGuidesOdd  ctermbg=10
        hi IndentGuidesEven ctermbg=black

        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1
    " } SPF-13 PIV {
        let g:DisableAutoPHPFolding=1
    " } Ctags {
        set tags=./tags;/,~/.vimtags

    " } Tabularize {
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>

        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>

    " } ctrlp {
        let g:ctrlp_working_path_mode = 2
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files'],
            \ },
            \ 'fallback': 'find %s -type f'
        \ }

    " } TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

    " } UndoTree {
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " }
" } Map {
    let mapleader = ','

    " shift+tab = unindent
    inoremap <S-TAB> <C-D>

    " Moving in files and between tabs & buffers {
        " between buffers
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_

        " between lines
        nnoremap j gj
        nnoremap k gk

        " between tabs
        map <S-H> gT
        map <S-L> gt
    " }

    nnoremap Y y$
    vnoremap < <gv
    vnoremap > >gv

    " helpers
    cnoremap %% <C-R>=expand('%:h').'/'<CR>
    map <leader>ew :edit %%
    map <leader>es :split %%
    map <leader>ev :vsplit %%
    map <leader>et :tabedit %%
    map <leader>tc :tabclose

    " ???
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    nmap <Del> <NOP>
" }

