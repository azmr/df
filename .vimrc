" be iMproved, required for vundle etc
set nocompatible
 " Some Linux distributions set filetype in /etc/vimrc.
 " Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
 " To ignore plugin indent changes, instead use:
filetype plugin on

" Brief help
" :BundleList          - list configured plugins
" :BundleInstall(!)    - install (update) plugins
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
" let path = '~/some/path/here'
" call vundle#rc(path)


" Bundles:
Bundle 'gmarik/vundle'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sirver/ultiSnips'
	Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'yegappan/mru'


" emmet config
let g:user_emmet_expandabbr_key="<c-e>"
let g:use_emmet_complete_tag = 1

" colorscheme config
set t_Co=256
"set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme default


" disable arrow keys for practice
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" graphical elements
set number

" tabs
set tabstop=4			" a tab is four spaces
set shiftwidth=4  		" number of spaces to use for autoindenting
set shiftround
set copyindent

set showmatch 			" show matching parens

" save when forgot sudo
cnoremap sudow w !sudo tee % >/dev/null 


"set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set pastetoggle=<F2>
nnoremap ; :

" Better Search
set smarttab   " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise

" Multiple Files
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
