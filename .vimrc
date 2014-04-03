" vim:fdm=marker

set shell=bash
set nocompatible
filetype off
" Vundle {{{
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
Bundle 'gmarik/vundle'
" }}}
" disable arrow keys for practice {{{
	map <up> <nop>
	map <down> <nop>
	map <left> <nop>
	map <right> <nop>
	imap <up> <nop>
	imap <down> <nop>
	imap <left> <nop>
	imap <right> <nop>
" }}}
" Bundles {{{
Bundle 'ap/vim-css-color'
Bundle 'cakebaker/scss-syntax.vim'
" Bundle 'chriskempson/base16-vim'
Bundle 'fatih/vim-go'
Bundle 'itchyny/lightline.vim'
" Bundle 'jnurmine/Zenburn'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sirver/UltiSnips'
	Bundle 'honza/vim-snippets'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Valloric/YouCompleteMe'
Bundle 'w0ng/vim-hybrid'
Bundle 'yegappan/mru'
" }}}
" Editor {{{
	" Aesthetics {{{
	set t_Co=256
	colorscheme hybrid
	" }}}

	" save when forgot sudo
	cnoremap sudow w !sudo tee % >/dev/null 
	
	set number

	" tabs
	set tabstop=4			" a tab is four spaces
	set shiftwidth=4  		" number of spaces to use for autoindenting
	set shiftround
	set copyindent

	set showmatch 			" show matching parens
	
	"set wildignore=*.swp,*.bak,*.pyc,*.class
	set title                " change the terminal's title
	set visualbell           " don't beep
	set noerrorbells         " don't beep
	set nobackup
	set pastetoggle=<F2>
	nnoremap ; :
	" Multiple Files
	set splitbelow
	set splitright
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	" Tagbar
	nmap <F8> :TagbarToggle<CR>

	" vim-signify (vcs tracking)
	let g:signify_vcs_list = ['git', 'hg']
	let g:signify_sign_overwrite = 0
" }}}
" Web {{{
	" emmet config {{{
		let g:user_emmet_expandabbr_key="<c-e>"
		let g:use_emmet_complete_tag = 1
	" }}}
	
" }}}
" Golang {{{
	au Filetype go nnoremap <F5> :w<CR>:GoRun %<CR>
	au Filetype go nnoremap <F6> :w<CR>:GoTest<CR>
" }}}
