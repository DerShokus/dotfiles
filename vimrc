""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"o-o            o-o  o        o                   o   o o-O-o o   o o--o    o-o
"|  \          |     |        | /                 |   |   |   |\ /| |   |  /
"|   O o-o o-o  o-o  O--o o-o OO   o  o o-o       o   o   |   | O | O-Oo  O
"|  /  |-' |       | |  | | | | \  |  |  \         \ /    |   |   | |  \   \
"o-o   o-o o   o--o  o  o o-o o  o o--o o-o     O   o   o-O-o o   o o   o   o-o
"
" My custom .vimrc config 2015.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Replace a default <leader> from '\' to ','
" Changing "mapleader" after that has no effect for already defined mappings.
let mapleader = ','




" {{{ Plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'powerman/vim-plugin-viewdoc'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

" Just fot Vim 7.4 version
if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

Plug 'rhysd/vim-clang-format'

Plug 'mhinz/vim-startify'
Plug 'will133/vim-dirdiff'
Plug 'mileszs/ack.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'git pull --recurse-submodules && bash ./install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dispatch'
"Plug 'itchyny/lightline.vim' "| Plug 'powerline/fonts', { 'do': 'bash ./install.sh' }
Plug 'bling/vim-airline'
"Plug 'ryanoasis/vim-devicons' | Plug 'ryanoasis/nerd-fonts', { 'do': 'bash ./install.sh' }
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/a.vim'
Plug 'dccmx/vim-lemon-syntax'
Plug 'rking/ag.vim'
Plug 'vim-scripts/google.vim'
Plug 'aperezdc/vim-template'
Plug 'junegunn/vim-easy-align'
"
" {{{ Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
" }}}
"
" {{{ Git helpers
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" }}}

" {{{ Try it at free time
Plug 'fisadev/FixedTaskList.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lekv/vim-clewn'
"Plug 'rhysd/vim-grammarous'
" Gdb helper (can't to build)
"Plug 'ManOfTeflon/exterminator'
" }}}


if has('nvim')
    Plug 'critiqjo/lldb.nvim'
    Plug 'neomake/neomake'
    Plug 'kassio/neoterm'
else " old good vim :)
    Plug 'gilligan/vim-lldb' " It's little bit broken
    Plug 'jeaye/color_coded', { 'do': 'cmake -f . && make && make install' }
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



let g:tagbar_iconchars = ['▸', '▾']
let g:webdevicons_enable = 0
let g:ag_highlight=1
" for ultisnips
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = [ '<C-n>', '<DOWN>' ]
let g:clang_complete_macros = 1

autocmd FileType c,cpp let &colorcolumn=join(range(81,256),",")



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
set clipboard=unnamed                       " use system copy/past buffer
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
set listchars=tab:▸\ ,eol:¬

"" Set up spell checker
set spl=en spell
set nospell

set nowrap
set cursorline

" Splists resizing by mouse
set mouse=a                            " enable mouse in console
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Ruler instead of numbers
set relativenumber
set number

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


" {{{ Plugin's keymaps
nmap <F9> :TagbarToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <leader>q :Bclose<cr>
nmap <leader>ff : NERDTreeFind<cr>

"nmap <leader>l :Unite -buffer-name=files buffer<cr>
"nmap <leader>l :FufBuffer<cr>
nmap <leader>l :CtrlPBuffer<cr>
nmap <leader>m :Make<cr>
nmap <leader>t :Dispatch ctest --output-on-failure<cr>
nmap <leader>c :Dispatch cppcheck .<cr>

nmap <C-]> :YcmCompleter GoTo<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" Unite
"let g:unite_source_grep_command = 'ag'
"nnoremap <space>/ :Unite grep:.<cr>
"
" Using ag as recursive command.
let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup',
        \  '--hidden', '']



" Auto commands {{{

" Delete trailing whitespace and do not move a cursor.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre c,cpp,perl :call <SID>StripTrailingWhitespaces()

" Just for vim.
autocmd FileType vim set foldmethod=marker
" }}}


let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''

" {{{ Light line settings
" Try it ;)
"let g:lightline = {
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'filename' ] ]
"      \ },
"      \ 'component_function': {
"      \   'fugitive': 'LightLineFugitive',
"      \   'readonly': 'LightLineReadonly',
"      \   'modified': 'LightLineModified',
"      \   'filename': 'LightLineFilename'
"      \ },
"      \ }
"" it's very sad but this symbols a slowly on my iTerm2 ;_;
""      \ 'separator': { 'left': '⮀', 'right': '⮂' },
""      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"
"function! LightLineModified()
"  if &filetype == "help"
"    return ""
"  elseif &modified
"    return "+"
"  elseif &modifiable
"    return ""
"  else
"    return ""
"  endif
"endfunction
"
"function! LightLineReadonly()
"  if &filetype == "help"
"    return ""
"  elseif &readonly
"    return "RO"
"  else
"    return ""
"  endif
"endfunction
"
"function! LightLineFugitive()
"  return exists('*fugitive#head') ? fugitive#head() : ''
"endfunction
"
"function! LightLineFilename()
"  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
"endfunction
" }}}




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


" powerline symbols
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'gruvbox'
" для tmux-like разделителя
set fillchars=vert:\│

hi VertSplit cterm=none ctermbg=none

let g:clang_format#auto_format = 0

function! s:Check()
  try
    let save_makeprg=&makeprg
    set makeprg=./run_cppcheck.sh
    " you may have to specify other files/extensions
    :Make
  finally
    let &makeprg=save_makeprg
  endtry
endfunction

nmap <leader>c :call <sid>Check()<cr>

" Snippets variables
let g:snips_author  = 'DerShokus'
let g:author        = 'DerShokus'
let g:snips_email   = 'lily.coder@gmail.com'
let g:email         = 'lily.coder@gmail.com'
let g:snips_github  = 'https://github.com/DerShokus'
let g:github        = 'https://github.com/DerShokus'
let g:snips_company = g:snips_author
let g:company       = g:snips_author

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:onedark_terminal_italics = 1

"{{{ TaskList
let g:tlWindowPosition = 0 " Open on the bottom
let g:tlTokenList = ['TODO', 'FIXME', 'NOTE']
"}}}
"
