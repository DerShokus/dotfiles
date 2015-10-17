""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ▓█████▄ ▓█████  ██▀███    ██████  ██░ ██  ▒█████   ██ ▄█▀ █    ██   ██████
" ▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒▒██    ▒ ▓██░ ██▒▒██▒  ██▒ ██▄█▒  ██  ▓██▒▒██    ▒ 
" ░██   █▌▒███   ▓██ ░▄█ ▒░ ▓██▄   ▒██▀▀██░▒██░  ██▒▓███▄░ ▓██  ▒██░░ ▓██▄   
" ░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄    ▒   ██▒░▓█ ░██ ▒██   ██░▓██ █▄ ▓▓█  ░██░  ▒   ██▒
" ░▒████▓ ░▒████▒░██▓ ▒██▒▒██████▒▒░▓█▒░██▓░ ████▓▒░▒██▒ █▄▒▒█████▓ ▒██████▒▒
"  ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒░▒░▒░ ▒ ▒▒ ▓▒░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░
"  ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░░ ░▒  ░ ░ ▒ ░▒░ ░  ░ ▒ ▒░ ░ ░▒ ▒░░░▒░ ░ ░ ░ ░▒  ░ ░
"  ░ ░  ░    ░     ░░   ░ ░  ░  ░   ░  ░░ ░░ ░ ░ ▒  ░ ░░ ░  ░░░ ░ ░ ░  ░  ░  
"    ░       ░  ░   ░           ░   ░  ░  ░    ░ ░  ░  ░      ░           ░  
" 
" My custom .vimrc config 2015.
"
" Sections: 
"   * Vundle
"   * Visual
"   * General
"   * Hotkeys
"   * Platforms
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Заменяет стандартную <leader> с '\' на ','
" Changing "mapleader" after that has no effect for already defined mappings.
let mapleader = ','


" {{{ Plugins

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'powerman/vim-plugin-viewdoc'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Just fot Vim 7.4 version
if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
Plug 'mhinz/vim-startify'             
Plug 'MattesGroeger/vim-bookmarks'    
Plug 'kien/ctrlp.vim'             
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-dispatch'
" Plug 'bling/vim-airline' | Plug 'powerline/fonts', { 'do': 'bash ./install.sh' }
Plug 'ryanoasis/vim-devicons' | Plug 'ryanoasis/nerd-fonts', { 'do': 'bash ./install.sh' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/a.vim'
Plug 'dccmx/vim-lemon-syntax'
Plug 'rking/ag.vim'
Plug 'vim-scripts/google.vim'
Plug 'twe4ked/vim-colorscheme-switcher'
Plug 'aperezdc/vim-template'
Plug 'ManOfTeflon/exterminator'

"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

call plug#end()

" }}}


if has("gui_running")
    set background=dark
    colorscheme solarized
    if has("gui_macvim")
        set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Pomicons:h14
    else
        set guifont=Anonymous\ Pro\ for\ Powerline\ 14
    endif
else
    set background=dark
    colorscheme solarized
    set t_Co=16
endif




let g:airline_powerline_fonts = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:ycm_global_ycm_extra_onf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:webdevicons_enable = 0
let g:ag_highlight=1


"let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn=join(range(81,999),",")



" {{{  General
syntax on
""" Base edit settings
set backspace=2                        " do backspace on eol and tabs
set encoding=utf-8                     " default character set
set nocompatible                       " disable vi
set noautochdir                        " do not change directory
set wrap                               " do wrap
set linebreak                          " do not break words
set hidden                             " do not reset buffer
set showcmd                            " auto complete for commands
set autoread                           " auto reread file
set confirm                            " show dialogs
set laststatus=2                       " size of status bar
set sessionoptions=curdir,buffers,tabpages " TODO?
set clipboard=unnamed                  " use system copy/past buffer
" be silently
set novisualbell
set noerrorbells
set t_vb=                              " do nothing
set title                              " show title in the top of console
""" Tabs and spaces """
set shiftwidth=4                       " size of spaces
set tabstop=4                          " size of tabs
set softtabstop=4                      " size of soft tabs
set autoindent                         " enable auto indents
set expandtab                          " tabs to spaces
set smartindent                        " tabs after { and others

""" 
set nobackup        " do not create backup files
set noswapfile      " do not create swap files

""" Search """
set hlsearch            " highlight search result
set ignorecase
set smartcase           " if all in low case - search without case
set incsearch           " searching by typing

"" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

"" Set up spell checker
set spl=en spell
set nospell

set nowrap

" Splists resizing by mouse
set mouse=a                            " enable mouse in console
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" }}}


" Base keymaps

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

" перходим по вкладкам по Alt-n или CMD-n
if has('mac')
    map <D-1> :tabfirst<cr>
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<cr>
else
    map <A-1> :tabfirst<cr>
    map <A-2> 2gt
    map <A-3> 3gt
    map <A-4> 4gt
    map <A-5> 5gt
    map <A-6> 6gt
    map <A-7> 7gt
    map <A-8> 8gt
    map <A-9> :tablast<cr>
endif


" Очень удобно т.к. не надо наживать шифт
" (главное не замапить обратно т.к. рекурсия)
map ; :










nmap <F9> :TagbarToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <leader>q :Bclose<cr>
"nmap <leader>l :Unite -buffer-name=files buffer<cr>
"nmap <leader>l :FufBuffer<cr>
nmap <leader>l :CtrlPBuffer<cr>
nmap <C-]> :YcmCompleter GoTo<cr>
nmap <leader>m :Make<cr>
nmap <C-TAB> :A<cr>


" для tmux-like разделителя
set encoding=utf8
set fillchars=vert:\│

" powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'






function! s:get_range()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

nnoremap <silent> & :exec 'VimGrep ' . expand('<cword>')<cr>
vnoremap <silent> & :exec 'VimGrep ' . s:get_range()
comm! -nargs=0 -range GdbVEval exec 'GdbEval ' . s:get_range()

nnoremap <silent> <F6>  :exec "GdbEval " . expand("<cword>")<CR>
vnoremap <silent> <F6>  :GdbVEval<cr>
nnoremap <silent> <F5>  :GdbLocals<CR>
nnoremap <silent> <F4>  :GdbNoTrack<CR>

nnoremap <silent> <Insert> :GdbContinue<cr>
nnoremap <silent> <End> :GdbBacktrace<cr>
nnoremap <silent> <Home> :GdbUntil<cr>
nnoremap <silent> <S-Up> :GdbExec finish<cr>
nnoremap <silent> <S-Down> :GdbExec step<cr>
nnoremap <silent> <S-Right> :GdbExec next<cr>
nnoremap <silent> <S-Left> :GdbToggle<cr>
noremap <silent> <PageUp> :GdbExec up<cr>
noremap <silent> <PageDown> :GdbExec down<cr>

function! s:start_debugging(cmd)
    cd /Users/dershokus/projects/test_application
    exec 'Dbg ' . a:cmd
endfunction
command! -nargs=1 DbgWrapper    call s:start_debugging(<f-args>)

nnoremap <silent> <leader>B :DbgWrapper ./main<cr>


" Unite
"let g:unite_source_grep_command = 'ag'
"nnoremap <space>/ :Unite grep:.<cr>
"
" Using ag as recursive command.
let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup',
        \  '--hidden', '']
