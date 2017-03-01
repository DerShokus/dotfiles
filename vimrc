"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"o-o            o-o  o        o                   o   o o-O-o o   o o--o    o-o
"|  \          |     |        | /                 |   |   |   |\ /| |   |  /
"|   O o-o o-o  o-o  O--o o-o OO   o  o o-o       o   o   |   | O | O-Oo  O
"|  /  |-' |       | |  | | | | \  |  |  \         \ /    |   |   | |  \   \
"o-o   o-o o   o--o  o  o o-o o  o o--o o-o     O   o   o-O-o o   o o   o   o-o
"
" My custom .vimrc config 2016.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Replace a default <leader> from '\' to ','
" Changing "mapleader" after that has no effect for already defined mappings.
let mapleader = ','

" {{{ Plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'powerman/vim-plugin-viewdoc'
Plug 'scrooloose/nerdcommenter'

" Just fot Vim 7.4 version
if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    let g:snips_author  = 'DerShokus'
    let g:author        = 'DerShokus'
    let g:snips_email   = 'lily.coder@gmail.com'
    let g:email         = 'lily.coder@gmail.com'
    let g:snips_github  = 'https://github.com/DerShokus'
    let g:github        = 'https://github.com/DerShokus'
    let g:snips_company = g:snips_author
    let g:company       = g:snips_author

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<up>"
endif

Plug 'rhysd/vim-clang-format'
let g:clang_format#auto_format = 0

Plug 'mhinz/vim-startify'
Plug 'will133/vim-dirdiff'
Plug 'MattesGroeger/vim-bookmarks'

Plug 'fatih/vim-go'

Plug 'Valloric/YouCompleteMe', { 'do': 'git pull --recurse-submodules && python ./install.py --clang-completer --gocode-completer' }
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = [ '<C-n>', '<DOWN>' ]
let g:clang_complete_macros = 1
nmap <C-]> :YcmCompleter GoTo<cr>
nmap <leader>fm :YcmCompleter FixIt<cr>
nmap <leader>gt :YcmCompleter GetType<cr>

Plug 'lyuts/vim-rtags'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'christoomey/vim-tmux-navigator'

"Plug 'tpope/vim-dispatch'
"set shellpipe+=\ 
"nmap <leader>m :call <sid>CustomMake('cmake', '--build . -- -j9')<cr> -- tmux 2.3
"nmap <leader>t :Dispatch ctest --output-on-failure<cr>
"nmap <leader>c :Dispatch cppcheck .<cr>

Plug 'skywind3000/asyncrun.vim'
nmap <leader>m :AsyncRun cmake --build . -- -j9<cr>


"Plug 'itchyny/lightline.vim' "| Plug 'powerline/fonts', { 'do': 'bash ./install.sh' }

"Plug 'bling/vim-airline'
""" Settings
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'gruvbox'
" для tmux-like разделителя

"Plug 'ryanoasis/vim-devicons' | Plug 'ryanoasis/nerd-fonts', { 'do': 'bash ./install.sh' }

Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }
""" Settings
let g:unite_source_grep_command = 'ag'
let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup',
        \  '--hidden', '']
nnoremap <space>/ :Unite grep:.<cr>
"nmap <leader>l :Unite -buffer-name=files buffer<cr>

Plug 'rbgrouleff/bclose.vim'
nmap <leader>q :Bclose<cr>

Plug 'vim-scripts/a.vim'
Plug 'dccmx/vim-lemon-syntax'
Plug 'vim-scripts/google.vim'
Plug 'aperezdc/vim-template'

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" {{{ Narigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
nmap <F8> :NERDTreeToggle<CR>
nmap <leader>ff : NERDTreeFind<cr>

Plug 'kien/ctrlp.vim'
nmap <leader>l :CtrlPBuffer<cr>

Plug 'jlanzarotta/bufexplorer'
nmap <F5> :BufExplorer<cr>

Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'
"nmap <leader>l :FufBuffer<cr>

Plug 'majutsushi/tagbar'
""" Settings
let g:tagbar_iconchars = ['▸', '▾']
nmap <F9> :TagbarToggle<CR>

" }}}

" {{{ Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'romainl/vim-qf'
" }}}

" {{{ Search tools
Plug 'mileszs/ack.vim'

Plug 'rking/ag.vim'
let g:ag_highlight=1
" }}}


" {{{ Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
Plug 'Marfisc/vorange'

Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
" }}}

" {{{ Git helpers
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" }}}

" {{{ Try it at free time
Plug 'fisadev/FixedTaskList.vim'
let g:tlWindowPosition = 0 " Open on the bottom
let g:tlTokenList = ['TODO', 'FIXME', 'NOTE']

Plug 'glidenote/memolist.vim'
let g:memolist_path = "~/dotfiles/memolist/"
map <leader>nl :MemoList<cr>
map <leader>nn :MemoNew<cr>
map <leader>ng :MemoGrep<cr>

Plug 'sheerun/vim-polyglot'
"Plug 'vim-scripts/doxygen-support.vim'
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

Plug 'rhysd/vim-grammarous'
" Gdb helper (can't to build)
"Plug 'ManOfTeflon/exterminator'
" }}}


if has('nvim')
    Plug 'critiqjo/lldb.nvim'
    Plug 'neomake/neomake'
    Plug 'kassio/neoterm'
else " old good vim :)
    "Plug 'gilligan/vim-lldb' " It's little bit broken
    Plug 'lekv/vim-clewn'
    "Plug 'jeaye/color_coded', { 'do': 'cmake -f . && make && make install' }
endif

call plug#end()

" }}}


" {{{ Appearance
set background=dark
colorscheme gruvbox

if has("gui_running")
    if has("gui_macvim")
        set guifont=Menlo:h12
    else
        set guifont=Inconsolata \ Pro\ for\ Powerline\ 14
    endif
elseif has('nvim')
    " termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
    set termguicolors
    " Clean background colors
    set t_ut=
endif
" }}}

"autocmd FileType c,cpp let &colorcolumn=join(range(81,256),",")
let colorcolumn=81

" {{{  General
syntax on
""" Base edit settings
set backspace=2                             " do backspace on eol and tabs
set encoding=utf-8                          " default character set
set nocompatible                            " disable vi
set noautochdir                             " do not change directory
set wrap                                    " do wrap
set linebreak                               " do not break words
set hidden                                  " do not reset buffer
set showcmd                                 " auto complete for commands
set autoread                                " auto reread file
set confirm                                 " show dialogs
set laststatus=2                            " size of status bar
set sessionoptions=curdir,buffers,tabpages  "
"set clipboard=unnamed                       " use system copy/past buffer
set clipboard+=unnamed
" be silently
set novisualbell
set noerrorbells
set t_vb=                                   " do nothing
set title                                   " show title in the top of console
""" Tabs and spaces """
set shiftwidth=4                            " size of spaces
set tabstop=4                               " size of tabs
set softtabstop=4                           " size of soft tabs
set autoindent                              " enable auto indents
set expandtab                               " tabs to spaces
set smartindent                             " tabs after { and others

"""
set nobackup                                " do not create backup files
set noswapfile                              " do not create swap files

""" Search """
set hlsearch                                " highlight search result
set ignorecase
set smartcase                               " if all in low case - search without case
set incsearch                               " searching by typing

"" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬,trail:·

"" Set up spell checker
set spl=en,ru
set nospell

set nowrap
set cursorline

" Splists resizing by mouse
set mouse=a                            " enable mouse in console
if &term =~ '^xterm'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Ruler instead of numbers
set relativenumber
set number

""" Menu
set wildmenu
set wildmode=longest:full,full

" }}}


" {{{ Base keymaps

" use normal up/down
nmap <DOWN>     j
nmap <UP>       k
" use visual up/down
nmap j          gj
nmap k          gk

" like emacs
nmap <C-e>      $
nmap <C-a>      ^
imap <C-e>      <C-o>A
imap <C-a>      <C-o>^
" for visual mode go to the end of a line without \n symbol
vmap <C-e>      $h
vmap <C-a>      ^
" normal page up/down
nmap <PageUp>   <C-U><C-U>
imap <PageUp>   <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>
" go to split in the normal mode
nmap <C-j>      <C-W>j
nmap <C-k>      <C-W>k
nmap <C-h>      <C-W>h
nmap <C-l>      <C-W>l
" go to the next word in the insert mode
imap <C-j>      <C-o>j
imap <C-k>      <C-o>k
imap <C-h>      <C-o>b
imap <C-l>      <C-o>w
" for the visual mode the same
vmap <C-j>      <C-o>j
vmap <C-k>      <C-o>k
vmap <C-h>      <C-o>b
vmap <C-l>      <C-o>w


" Очень удобно т.к. не надо наживать шифт
" (главное не замапить обратно т.к. рекурсия)
map ; :

" }}}

" Auto commands {{{

" Delete trailing whitespace and do not move a cursor.
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp autocmd BufWritePre * :call StripTrailingWhitespaces()

" Just for vim.
autocmd FileType vim set foldmethod=marker
" }}}

nnoremap <leader>ev :e ~/.vimrc<cr>

"{{{ some special conde style %)
function! BracketInsert()
    let l:colum = col ('.')
    if l:colum == 1 || getline('.')[col('.')-2] == ' '
        return '('
    else
        return ' ('
    endif
endfunction

"inoremap ( <C-r>=BracketInsert()<cr>
"}}}


set fillchars=vert:\│

"hi VertSplit cterm=none ctermbg=none


function! s:CustomMake(prg, params)
  try
    let save_makeprg=&makeprg
    let &makeprg = a:prg
    " you may have to specify other files/extensions
    execute 'Make ' . a:params
  finally
    let &makeprg=save_makeprg
  endtry
endfunction

nmap <leader>c :call <sid>CustomMake('./run_cppcheck.sh', '')<cr>

set lazyredraw 
let html_no_rendering=1
let g:ycm_autoclose_preview_window_after_insertion = 1
