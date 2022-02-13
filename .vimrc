" vim: set foldmethod=marker :
" Plugins {{{
        " Load vim plug manager if needed {{{{
                if empty(glob('~/.vim/autoload/plug.vim'))
                  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
                endif

        " }}}
        call plug#begin('~/.vim/plugged')
    Plug 'w0ng/vim-hybrid'
    Plug 'godlygeek/tabular'
    Plug 'lilydjwg/colorizer'
    Plug 'editorconfig/editorconfig-vim'

        Plug 'itchyny/lightline.vim'        " status bar
    Plug 'junegunn/goyo.vim'            " distraction free file editing
        Plug 'Yggdroot/indentLine'          " indent
        call plug#end()
" }}}

" Visual {{{
        " Colors {{{
                syntax on                        " enable syntax processing
                set t_Co=256                     " enable 256 colors
                set backgrund=darko              " set dark theme
                set number relativenumber        " show line numbers
                let g:javascript_plugin_flow=1   " enable syntax for Flow
                let g:javascript_plugin_jsdoc=1  " enable syntax for @jsdoc

                if has('gui_running')            " setup font family:size
                        set guifont =VictorMono:h14
                endif

                if (has("termguicolors"))        " enable true colors support
            set termguicolors
                endif

                colorscheme hybrid
        " }}}
        " Light Line {{{
                set laststatus=2  " Display Light line
                set noshowmode    " Hide default status bar

                let g:lightline = {
                      \ 'colorscheme': 'apprentice',
                      \ 'active': {
                      \   'left': [ [ 'mode', 'paste' ],
                      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
                     \ },
                       \ 'component_function': {
                      \   'gitbranch': 'fugitive#head'
                      \ },
                      \ }
        " }}}
        " Folding {{{
        set foldmethod=expr

                " toggle folding with tab
                nnoremap <leader><space> za
        " }}}
" }}}

" General {{{
        set nocompatible
        set noswapfile
        " 1 tab == 4 spaces
        set tabstop=4 shiftwidth=4

        " use spaces instead of tabs
        set expandtab

    " JSON {{{
        " disable hiding quotes in *.json files
        set conceallevel=0
        let g:indentLine_setConceal= 0
        let g:vim_json_syntax_conceal= 0
        if &filetype=='json'
            set foldmethod=syntax
        endif
    " }}}

    " disable bell in MACVIM
    set belloff=all

        " always indent by multiple of shiftwidth
        set shiftround

        " indend/deindent at the beginning of a line
        set smarttab

    " enable mouse sroll and select
    set mouse=a

   c " speedup render
    set  ttyfast
    set lazyredraw

    " disable search highlight after done.
    augroup vimrc-incsearch-highlight
        autocmd!
        autocmd CmdlineEnter [/\?] :set hlsearch
        autocmd CmdlineLeave [/\?] :set nohlsearch
    augroup END

    " ignore swapfile messages
    set shortmess+=A
    " no splash screen
    set shortmess+=I

    " draw less
    set lazyredraw

    set autoindent
    filetype plugin indent on

    set backspace=indent,eol,start

    let g:netrw_winsize=85
    " enable explorer preview by pressint "p"
    let g:netrw_preview=1
    " open file from explorer in ver split
    let g:netrw_browse_split=2

   " Mappings {{{
        " j + k = <esc>
        inoremap jk <esc>
        " Copy to OS clipboard
        vmap <leader>c "*y
        " Paste from OS clipboard
        map <leader>v "*p
        " Reload config
        map <leader>r :source ~/.vimrc<CR>

        " Split Alterative
        nnoremap <Tab>h <C-W>
        nnoremap <Tab>j <C-W>j
        nnoremap <hTab>k <C-W>k
        nnoremap <Tab>l <C-W>l

        " Resize active split
        nnoremap <C-h> <C-W>5<'
        nnoremap <C-j> <C-W>5-'
        nnoremap <C-k> <C-W>5+'
        nnoremap <C-l> <C-W>5>'
    " }}}
" }}}

