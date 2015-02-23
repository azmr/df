" Preamble {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" }}}
" Plugins {{{
Plugin 'ap/vim-css-color'				" highlight colours in css files
Plugin 'cakebaker/scss-syntax.vim'		" Syntax file for SCSS
Plugin 'fatih/vim-go'					" Go development plugin. Install required binaries with ':GoInstallBinaries'
Plugin 'itchyny/lightline.vim'			" improves info for statusline
" Plugin 'jnurmine/Zenburn'				" colourscheme: low contrast 'alien fruit salad'
Plugin 'majutsushi/tagbar'				" tags outline viewer
Plugin 'mattn/emmet-vim'				" expands html/css tags
Plugin 'mhinz/vim-signify'				" VCS diff in sign column
Plugin 'shougo/neomru.vim'				" most recently used
Plugin 'shougo/neocomplcache.vim'		" autocomplete, doesn't require Lua
" Plugin 'shougo/neocomplete.vim'			" autocomplete, does require Lua
Plugin 'shougo/neosnippet.vim'			" snippets engine
	Plugin 'shougo/neosnippet-snippets'		" snippets files
Plugin 'shougo/unite.vim'				" fuzzy search/navigate files/buffers/other arbitrary sources. NEEDS CONFIG
Plugin 'shougo/vimfiler.vim'			" filesystem explorer
Plugin 'shougo/vimshell.vim'			" platform independent shell (works with unite)
Plugin 'scrooloose/syntastic'			" syntax checking
Plugin 'sjl/gundo.vim'					" graphs the undo tree
Plugin 'terryma/vim-expand-region'		" visually select increasingly larger/smaller regions of text (+/_)
Plugin 'terryma/vim-multiple-cursors'	" multiple cursors with <C-n>/<C-p>/<C-x> (skip)
Plugin 'tpope/vim-abolish' 				" complex search & replace
Plugin 'tpope/vim-commentary' 			" gcc/gc* to comment lines/movement
Plugin 'tpope/vim-fugitive' 			" git wrapper: Gstatus, Gmove etc
Plugin 'tpope/vim-repeat' 				" allows other plugins to use '.' repeat
Plugin 'tpope/vim-sensible' 			" basic uncontroversial .vimrc
Plugin 'tpope/vim-speeddating' 			" C-A/C-X to increment times, dates and more
Plugin 'tpope/vim-surround' 			" quoting/parenthesizing made simple
Plugin 'tpope/vim-unimpaired' 			" pairs of handy bracket mappings
Plugin 'w0ng/vim-hybrid' 				" colourscheme: colour palette from Tomorrow-Night; syntax group highlighting scheme from Jellybeans; Vim code from Solarized

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Editor {{{
	" Aesthetics {{{
	set t_Co=256
	colorscheme hybrid
	" }}}
	" Autocompetion {{{
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 2
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Enable heavy features.
	" Use camel case completion.
	"let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	"let g:neocomplcache_enable_underbar_completion = 1
	"
	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g> neocomplcache#undo_completion()
	inoremap <expr><C-l> neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplcache#smart_close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ?  neocomplcache#close_popup() : '\<CR>'
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ?  "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y> neocomplcache#close_popup()
	inoremap <expr><C-e> neocomplcache#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left> neocomplcache#close_popup() . '\<Left>'
	"inoremap <expr><Right> neocomplcache#close_popup() . '\<Right>'
	"inoremap <expr><Up> neocomplcache#close_popup() . '\<Up>'
	"inoremap <expr><Down> neocomplcache#close_popup() . '\<Down>'
	" Or set this.
	"let g:neocomplcache_enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplcache_enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ?
	"\<Down>" : '\<C-x>\<C-u>'

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_force_omni_patterns')
		let g:neocomplcache_force_omni_patterns = {}
	endif
	let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
" Files {{{
set title
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Statusline {{{
let g:lightline = {
			\'colorscheme': 'wombat',
			\'active': {
			\	'left': [	[ 'mode', 'paste' ],
			\				[ 'fugitive', 'filename', 'readonly', 'modified' ] ]
			\},
			\'component': {
			\	'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
			\},
			\'component_visible_condition': {
			\	'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
			\}
			\}
" }}}
" Syntax {{{
" syntastic recommended settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" Tabs {{{
set tabstop=4
set shiftwidth=4
set shiftround
set copyindent
" }}}
" Tags {{{
" let g:tagbar_ctags_bin = "e:/Program Files/ctags58/ctags.exe"
nmap <F8> :TagbarToggle<CR>
	" Go Ctags {{{
	" let g:tagbar_type_go = {
	" 	\ 'ctagstype' : 'go',
	" 	\ 'kinds'     : [
	" 		\ 'p:package',
	" 		\ 'i:imports:1',
	" 		\ 'c:constants',
	" 		\ 'v:variables',
	" 		\ 't:types',
	" 		\ 'n:interfaces',
	" 		\ 'w:fields',
	" 		\ 'e:embedded',
	" 		\ 'm:methods',
	" 		\ 'r:constructor',
	" 		\ 'f:functions'
	" 	\ ],
	" 	\ 'sro' : '.',
	" 	\ 'kind2scope' : {
	" 		\ 't' : 'ctype',
	" 		\ 'n' : 'ntype'
	" 	\ },
	" 	\ 'scope2kind' : {
	" 		\ 'ctype' : 't',
	" 		\ 'ntype' : 'n'
	" 	\ },
	" 	\ 'ctagsbin' : 'gotags'
	" 	\ 'ctagsargs' : '-sort -silent'
	" 	\ }
	" }}}
" }}}

" save when forgot sudo
cnoremap sudow w !sudo tee % >/dev/null

set number " line numbers
set foldmethod=marker
nnoremap ; :
" }}}
" File tree {{{
let g:vimfiler_as_default_explorer = 1
" }}}
