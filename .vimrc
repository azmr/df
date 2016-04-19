" Preamble {{{
set nocompatible
filetype off                  " required

" avoid autocmd duplicates
" autocmd!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" let path='~/.vim/bundle'
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" }}}

" Plugins {{{
Plugin 'azmr/vim-gdb'					" simple way to interact with GDB from vim
Plugin 'dhruvasagar/vim-table-mode'		" automatic table creator & formatter
Plugin 'fatih/vim-go'					" Go development plugin. Install required binaries with ':GoInstallBinaries'
Plugin 'junegunn/rainbow_parentheses.vim' " rainbow parens
Plugin 'majutsushi/tagbar'				" tags outline viewer ***Requires Ctags***
Plugin 'mattn/emmet-vim'				" expands html/css tags
Plugin 'mhinz/vim-signify'				" VCS diff in sign column
Plugin 'rust-lang/rust.vim'				" rust file detection, syntax highlighting, and (optional) autoformatting
Plugin 'scrooloose/syntastic'			" syntax checking
Plugin 'sheerun/vim-polyglot'			" 50+ language pack
Plugin 'sjl/gundo.vim'					" graphs the undo tree
Plugin 'takac/vim-hardtime'				" to help you stop repeating the basic movement keys (:HardTimeToggle)
Plugin 'tmhedberg/matchit'				" extended % matching for HTML, LaTeX, and many other languages
Plugin 'tpope/vim-abolish'				" complex search & replace
Plugin 'tpope/vim-afterimage'			" edit binary files by converting them to text equivalents
Plugin 'tpope/vim-commentary'			" gcc/gc* to comment lines/movement
Plugin 'tpope/vim-fugitive'				" git wrapper: Gstatus, Gmove etc
Plugin 'tpope/vim-repeat'				" allows other plugins to use '.' repeat
Plugin 'tpope/vim-obsession'			" continuously updated session files
Plugin 'tpope/vim-sensible'				" basic uncontroversial .vimrc
Plugin 'tpope/vim-speeddating'			" C-A/C-X to increment times, dates and more
Plugin 'tpope/vim-surround'				" quoting/parenthesizing made simple
Plugin 'tpope/vim-unimpaired'			" pairs of handy bracket mappings
Plugin 'vim-scripts/camelcasemotion'	" motion through CamelCaseWords and underscore_notation
Plugin 'vim-scripts/TagHighlight'		" highlights struct, variable names etc
Plugin 'w0ng/vim-hybrid'				" colourscheme: colour palette from Tomorrow-Night; syntax group highlighting scheme from Jellybeans; Vim code from Solarized
" Plugin 'xolox/vim-easytags'				" tag generation and highlighting
" Plugin 'xolox/vim-misc'					" xolox lib
"Plugin 'wesgibbs/vim-irblack'			" colourscheme: 16 bit
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" }}}

" Setup {{{
set fileformats=unix,dos	" use unix line endings by default (prevents breaking)
if has('win32')
	cd E:\Documents\Coding
elseif has('unix')
	cd ~/code
endif
" }}}

" Spaces and Tabs {{{
set tabstop=4			" number of columns per TAB
set shiftwidth=4		" number of columns per indent/outdent (>>/<<)
set noexpandtab			" tabs are individual characters, not spaces
set shiftround			" rounds indent to multiple of shiftwidth
set copyindent			" new lines continue previous indentation
" }}}

" UI {{{
if &term ==# 'linux'
	set t_Co=256		" allows fancy colorschemes in terminal
endif
colorscheme hybrid		" sets colorscheme to hybrid
set number              " show line numbers
set showcmd             " show most recent command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
filetype indent on      " load filetype-specific indent files
set hidden				" allows you to change out of unsaved buffers
set textwidth=0			" no autowrapping

	" Listchars {{{
	" toggle with set list!
	set listchars=tab:\|\		" tabs
	set listchars+=trail:-		" trailing spaces
	set listchars+=extends:>	" characters off screen to right
	set listchars+=precedes:<	" characters off screen to left
	set listchars+=nbsp:_		" non-breaking spaces
	" }}}

	" Statusline {{{
	" allows InsertLeave to be triggered without ruining <c-c> for general use
	inoremap <c-c> <Esc>
	augroup statusline
		autocmd!
		autocmd InsertEnter * highlight StatusLine term=reverse cterm=reverse ctermfg=110 ctermbg=234 gui=reverse guifg=#81a2be guibg=#1d1f21
		autocmd InsertLeave	* highlight StatusLine term=reverse cterm=reverse ctermfg=243 ctermbg=234 gui=reverse guifg=#707880 guibg=#1d1f21
	augroup END

	function! StatusLine()
		" vim default: statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
		set statusline=\ 			" pad 1 space on left
		set statusline+=%f			" file path relative to working directory
		set statusline+=\ 			" separator
		set statusline+=%{FileSize()}	" file size in B/KB
		set statusline+=\ 			" separator
		set statusline+=%q			" quickfix/location list flag
		set statusline+=%w			" preview flag
		set statusline+=%h			" help doc flag
		set statusline+=%m			" modified flag
		set statusline+=%r			" readonly flag

		set statusline+=%=			" right align all content after this

		set statusline+=%{GetGitBranch()}	" git branch in the format [branch]
		set statusline+=\ \|\ 		" separator
		set statusline+=%3.c		" (3-padded) column number
		set statusline+=,			" separator
		set statusline+=%4.l/%-4.L	" (4-padded) line number/max lines
		set statusline+=\ 			" pad 1 space on right
	endfunction

	call StatusLine()
	" }}}

	" Diff {{{
	" ignore whitespace
	set diffopt=filler
	set diffopt+=iwhite
	set diffopt+=icase
	" }}}
" }}}

" Search {{{
set incsearch           " search as characters are entered
set ignorecase			" case insensitive searches...
set smartcase			" ... except when they include capitals
" set hlsearch            " highlight matches
" nnoremap / :nohl<CR>/	" removes highlight on next find
" }}}

" Folding {{{
set foldenable			" enable folding
set foldmethod=marker	" fold by markers
set foldlevelstart=10   " open most folds by default
" }}}

" Movement {{{
" move vertically by visual line and remap alt movement to literal lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" }}}

" Leader Shortcut Mappings {{{
" make space leader, keeping a viable showcmd
map <space> <leader>
" cycle buffers
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bN :bLast<cr>
nnoremap <leader>bP :bfirst<cr>
" change directory to current file's
nnoremap <leader>% :cd %:p:h<cr>
" use undo tree (super undo)
nnoremap <leader>u :GundoToggle<CR>
" quick save
nnoremap <Leader>w :w<CR>
" quick edit .vimrc
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vv :vsplit $MYVIMRC<cr>
nnoremap <leader>vh :hsplit $MYVIMRC<cr>
" quick source .vimrc, sourcing normally changes working directory to default
nnoremap <leader>vs :source $MYVIMRC<cr>

" copy and paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" paste replacing selection TODO: turn into plugin and put on github
nnoremap <leader>cp :set operatorfunc=ChangePut<cr>g@
vnoremap <leader>cp :<c-u>call ChangePut(visualmode())<cr>

" search across open buffers (and echo found line)
nnoremap <leader>b/ :bufdo //e <bar> echo expand('.')<c-left><c-left><c-left><c-left><right>
" search and replace across open buffers
nnoremap <leader>bs :bufdo %s//ge<left><left><left>

" TODO: implement repeat.vim
" TODO: take from specific register
function! ChangePut(type)
	if a:type ==# 'v'
		execute 'normal! `<v`>"_dP'
	elseif a:type ==# 'V'
		execute "normal! '<V'>\"_dP"
	elseif a:type ==# 'char'
		execute 'normal! `[v`]"_dP'
	else
		return
	endif
endfunction

" call QuickGDB with the option of arguments
nnoremap <leader>g :call QuickGDB()<left>
" }}}

" Misc Mappings {{{
" move lines up and down
nnoremap <c-k> "lddk"lP
nnoremap <c-n> "ldd"lp
" move WORDS left and right (doesn't quite work currently)
" nnoremap <c-l> "wdaWEl"wph
" nnoremap <c-h> "wdaWBh"wP
" swap n and j
	" 'n'ext line, this line 'N' the next one
noremap n j
noremap N J
noremap <c-w>N <c-w>J
	" 'j'ump to next find, 'J'ump to previous find
noremap j n
noremap J N
noremap <c-w>J <c-w>N
" swap ; and :
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
" make Y follow same pattern as C and D... yank to end of line
nnoremap Y y$
" save when forgot sudo
cnoremap sudow w !sudo tee % >/dev/null
" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
" gp to select previously pasted text in previous selection mode (linewise, blockwise etc)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" open location list with <F8>
nnoremap <F8> :lopen<cr>
" apply @@ or . to each line in a visual selection
vnoremap @@ :normal @@<cr>
vnoremap . :normal .<cr>
" echo highlighting group 
noremap <F3> :echo synIDattr(synID(line("."),col("."),1),"name")<cr>
" }}}

" Languages {{{
	" C {{{
" Compiler message highlighting
	highlight! link CompileError SpellBad
	highlight! link CompileWarning SpellCap
	highlight! link CompileComplete Special

	augroup c
		autocmd!
		autocmd FileType c setlocal foldmethod=syntax
	augroup END
	augroup c
		autocmd!
		" update tags for highlighting
		autocmd BufNewFile,BufReadPost *.h set filetype=c
		autocmd FileType c nnoremap <buffer> <F11> :w<cr>:silent !ctags --format=2 --excmd=pattern --extra= --fields=nksaSmt --c-kinds=-m *.c *.h<cr>:UpdateTypesFileOnly<CR>
		autocmd FileType c inoremap <buffer> #if<space> #if <end><cr>#else<cr>#endif<up><up><end>

	augroup END
	if has('win32')
		augroup c_win
			autocmd!
			" \ms to search msdn for word under cursor
			autocmd FileType c nnoremap <buffer> <leader>ms "iyiw:!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://social.msdn.microsoft.com/search/en-US/windows.html?query=<c-r>i<cr>
			autocmd FileType c nnoremap <buffer> <F5> :silent !"E:\Documents\Coding\C\build\.exe"<left><left><left><left><left>
			autocmd FileType c nnoremap <buffer> <F6> :w \| call CompileCAsync()<cr>
			autocmd FileType c nnoremap <buffer> <F7> :w \| silent !E:\Documents\Coding\C\shell.bat && build.bat && devenv<cr>
		augroup END
	endif
	" }}}

	" C++ {{{
	if has('win32')
		augroup cpp_win
			autocmd!
			autocmd FileType cpp nnoremap <buffer> <F5> :silent !"E:\Documents\Coding\C\build\.exe"<left><left><left><left><left>
			autocmd FileType cpp nnoremap <buffer> <F6> :w \| !E:\Documents\Coding\C\shell.bat && build.bat<cr>
			autocmd FileType cpp nnoremap <buffer> <F7> :w \| silent !E:\Documents\Coding\C\shell.bat && build.bat && devenv<cr>
		augroup END
	endif
	" }}}


	" C-like {{{
	augroup c_like
		autocmd!
		autocmd FileType c,cpp,go,javascript,rust,vim :inoremap <buffer> {<cr> {<cr>}<esc>O
		autocmd FileType c,cpp,go,javascript,rust,vim setlocal foldmethod=syntax
	augroup END
	" }}}
	
	" Go {{{
	let g:go_fmt_autosave = 1
	let g:go_fmt_command = "goimports"

	let g:go_snippet_engine = "neosnippet"

	let g:go_highlight_functions = 1
	" let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1

	" show type info (:GoInfo) for word under cursor 
	let g:go_auto_type_info = 1
	" }}}

	" Git {{{
	augroup git
		autocmd!
		autocmd FileType gitcommit setlocal textwidth=72
	augroup END
	" }}}

	" Javascript {{{
	augroup ft_js
		autocmd!
		autocmd FileType javascript nnoremap <buffer> <F7> :w \| silent !explorer index.html<cr>
	augroup END
	" }}}

	" Markdown {{{
		augroup ft_md
			autocmd!
			" read '.md' files as Markdown, not Modula-2 
			autocmd BufNewFile,BufReadPost *.md set filetype=markdown
			" operator inner and around headings
			autocmd FileType markdown :onoremap <buffer> i= :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a= :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
			autocmd FileType markdown :onoremap <buffer> i- :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a- :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
			autocmd FileType markdown :onoremap <buffer> i1 :<c-u>execute "normal! ?^# \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a1 :<c-u>execute "normal! ?^# \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> i2 :<c-u>execute "normal! ?^## \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a2 :<c-u>execute "normal! ?^## \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> i3 :<c-u>execute "normal! ?^### \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a3 :<c-u>execute "normal! ?^### \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> i4 :<c-u>execute "normal! ?^#### \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a4 :<c-u>execute "normal! ?^#### \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> i5 :<c-u>execute "normal! ?^##### \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a5 :<c-u>execute "normal! ?^##### \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> i6 :<c-u>execute "normal! ?^###### \\=\r:nohlsearch\rwvg_"<cr>
			autocmd FileType markdown :onoremap <buffer> a6 :<c-u>execute "normal! ?^###### \\=\r:nohlsearch\rvg_"<cr>
			autocmd FileType markdown :nnoremap <buffer> <leader>= o======================================================================================================<c-c>khjllDk
			autocmd FileType markdown :nnoremap <buffer> <leader>- o------------------------------------------------------------------------------------------------------<c-c>khjllDk
			autocmd FileType markdown :nnoremap <buffer> <leader><leader>= o======================================================================================================<cr><c-c>k$khjllDk
			autocmd FileType markdown :nnoremap <buffer> <leader><leader>- o------------------------------------------------------------------------------------------------------<cr><c-c>k$khjllDk
			autocmd FileType markdown :nnoremap <buffer> <leader>1 I# <c-c>
			autocmd FileType markdown :nnoremap <buffer> <leader>2 I## <c-c>
			autocmd FileType markdown :nnoremap <buffer> <leader>3 I### <c-c>
			autocmd FileType markdown :nnoremap <buffer> <leader>4 I#### <c-c>
			autocmd FileType markdown :nnoremap <buffer> <leader>5 I##### <c-c>
			autocmd FileType markdown :nnoremap <buffer> <leader>6 I###### <c-c>
		augroup END
	" }}}

	" Rust {{{
	augroup ft_rust
		" remove any duplicates of this group
		" au!
		" exchange _a_ for _b_ (snippet-like)
		" autocmd FileType rust :iabbrev <buffer> _a_ _b_
		autocmd!
		autocmd FileType rust nnoremap <buffer> <F7> :!cargo run<cr>
	augroup END
	" }}}

	" Vimscript {{{
		augroup ft_vim
			autocmd!
			autocmd FileType vim setlocal foldmethod=marker
			autocmd FileType vim setlocal nowrap
			" create augroup block from aug
			autocmd FileType vim :iabbrev <buffer> aug augroupa<bs><cr>augroupa<bs> END<up><end>
			autocmd FileType vim :iabbrev <buffer> iff ifa<bs><cr>endifa<bs><up><end>
		augroup END
	" }}}
" }}}

" Syntax {{{
" syntastic recommended settings:
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}

" Tags {{{
" toggle tagbar with F9
nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = "e:/Program Files/ctags58/ctags.exe"

" easytags settings
" let g:easytags_auto_update = 0

" Tag Highlight settings
if ! exists('g:TagHighlightSettings')
	let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['CtagsExecutable'] = 'e:/Program Files/ctags58/ctags.exe'
let g:TagHighlightSettings['PythonVariantPriority'] = ["compiled", "python", "if_pyth3", "if_pyth"]
let g:TagHighlightSettings['LanguageDetectionMethods'] = ["FileType", "Extension", "Syntax"]

hi! link cTagsMember Ignore
hi! link CTagsDefinedName PreProc
hi! link CTagsGlobalVariable Identifier
hi! link cOperator Statement

" used for library: C:\Program Files (x86)\Windows Kits\8.1\Include>ctags --format=2 --excmd=pattern --extra=fq --fields=nksaSmt --c-kinds=cntse --recurse=yes
" }}}

" Windows {{{
set title			" sets terminal title to filename
set splitbelow		" new splits go below
set splitright		" new vsplits go right

" Arrow keys resize windows
nnoremap <left>  :3wincmd <<cr>
nnoremap <right> :3wincmd ><cr>
nnoremap <up>    :3wincmd +<cr>
nnoremap <down>  :3wincmd -<cr>

" simplify navigating windows with <C-[arrow]>
nnoremap <C-down> <C-W><C-J>
nnoremap <C-up> <C-W><C-K>
nnoremap <C-right> <C-W><C-L>
nnoremap <C-left> <C-W><C-H>

nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" create windows in specified direction
" }}}

" Autocommands {{{
augroup misc
	autocmd!
	" format all opened (non readonly) files for unix
	autocmd BufRead,BufNewFile * if &readonly==#0 && &modifiable==#1|set fileformat=unix
	
	" automatically leave insert mode after 'updatetime' milliseconds of inaction
	autocmd CursorHoldI * stopinsert

	" set 'updatetime' to 5 seconds when in insert mode
	autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=6000
	autocmd InsertLeave * let &updatetime=updaterestore
augroup END
" }}}

" Functions {{{
function! GetGitBranch() " requires fugitive.vim
	if fugitive#statusline() =~# '\m(\(.*\))'
		return '['.matchlist(fugitive#statusline(), '(\(.*\))')[1].']'
	endif
	return ''
endfunction

function! FileSize()
     let bytes = getfsize(expand('%:p'))
     if bytes <= 0
         return ''
     endif
     if bytes < 1024
         return '(' . bytes . 'B' . ')'
     else
         return '(' . (bytes / 1024) . 'kB' . ')'
     endif
endfunction
" }}}

function! BufdoSearch(query)
	let l:search=':bufdo /'.a:query.'/e'
	echom l:search
	split ___BUFSEARCHES___
	exec 'redir !> ___BUFSEARCHES___ | '.l:search.' | redir END'
	"let g:bsearchresult=substitute(@m, '\(E\d*:.\+\n\)|\(search .\+TOP\n\)', '', '')
	" echom l:result
endfunction

function! CompileCSync()
    " Get the bytecode.
    if has('win32')
		let result = system('E:\Documents\Coding\C\shell.bat && build.bat')
	endif

    " Open a new split and set it up.
    split __C_Compilation_Result__
    normal! ggdG
    " setlocal filetype=
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(result, '\v\n'))
endfunction

" TODO: input lines progressively rather than all in one go
function! CompileCAsync()
	let temp_file = tempname()
	exec 'silent !start cmd /c "E:\Documents\Coding\C\shell.bat & build.bat > '.temp_file.
				\ ' & vim --servername '.v:servername.' --remote-expr "GetAsyncText('."'".temp_file."')\""
endfunction

function! GetAsyncText(temp_file_name)
    vsplit __C_Compilation_Result__
    normal! ggdG
    setlocal filetype=compilation_message
    setlocal buftype=nofile
	syntax keyword CompileError fatal error
	syntax keyword CompileWarning warning
	syntax keyword CompileComplete compilation complete

	call append(0, readfile(a:temp_file_name))
	normal! ocompilation complete
	call delete(a:temp_file_name)
endfunction

