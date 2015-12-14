"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               /\/|  __              _
"              |/\/  / /     __   __ (_)  _ __ ___  _ __ ___
"                   / /      \ \ / / | | | '_ ` _ \| '__/ __|
"                  / /    _   \ V /  | | | | | | | | | | (__
"                 /_/    (_)   \_/   |_| |_| |_| |_|_|  \___|
"
"   Maintainer: Jose Elera (https://github.com/jelera)
"               http://www.twitter.com/jelera
"
" Last Updated: Fri 27 Nov 2015 01:09:50 PM CST
"
"   Disclaimer: You are welcome to take a look at my .vimrc and take ideas in
"               how to customize your Vim experience; though I encourage you
"               to experiment with your own mappings, plugins and configs.
"
"      License: MIT
"               Copyright (c) 2014 Jose Elera Campana
"
"               Permission is hereby granted, free of charge, to any person
"               obtaining a copy of this software and associated documentation
"               files (the "Software"), to deal in the Software without
"               restriction, including without limitation the rights to use,
"               copy, modify, merge, publish, distribute, sublicense, and/or
"               sell copies of the Software, and to permit persons to whom the
"               Software is furnished to do so, subject to the following
"               conditions:
"
"               The above copyright notice and this permission notice shall be
"               included in all copies or substantial portions of the
"               Software.
"
"               THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
"               KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
"               WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
"               PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
"               COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"               LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
"               OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"               SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"----------------------------------------------------------------------------//
" NEOBUNDLE AND 3RD-PARTY PLUGINS                                           {{{
"----------------------------------------------------------------------------//
set nocompatible
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

"------------------------------------+
" Neobundle, Vimproc               {{{
"------------------------------------+
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\ 'windows' : 'make -f make_mingw32.mak',
	\ 'cygwin' : 'make -f make_cygwin.mak',
	\ 'mac' : 'make -f make_mac.mak',
	\ 'unix' : 'make -f make_unix.mak',
	\ },
\ }
"}}}

"------------------------------------+
" Plugins (settings and mappings)  {{{
"------------------+-----------------+
" UI/Usability   {{{
"------------------+
NeoBundle 'bling/vim-airline' "{{{
	let g:airline_powerline_fonts = 1
	let g:airline_theme = "tomorrow"
	let g:airline_section_c = '%t %{GetFileSize()} (%{GetCwd()})'
"}}}

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-startify'
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
\ 'autoload':{'commands':'Gitv'}}
"}}}

"------------------+
" Text helpers   {{{
"------------------+
NeoBundle 'tpope/vim-fugitive' " {{{
	" automatically delete fugitive buffers when leaving them
	autocmd BufReadPost fugitive://* setlocal bufhidden=delete
"}}}

NeoBundle 'scrooloose/syntastic' " {{{
	let g:syntastic_enable_signs = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_python_checkers = ['flake8']
"}}}

NeoBundle 'Shougo/neosnippet' " {{{
	" Plugin key-mappings.
	imap <C-k> <Plug>(neosnippet_expand_or_jump)
	smap <C-k> <Plug>(neosnippet_expand_or_jump)
	xmap <C-k> <Plug>(neosnippet_expand_target)
	" SuperTab like snippets behavior.
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: "\<TAB>"
	" For snippet_complete marker.
	if has('conceal')
	set conceallevel=2 concealcursor=i
	endif
	" Enable snipMate compatibility feature.
	let g:neosnippet#enable_snipmate_compatibility = 1
	" Tell Neosnippet about the other snippets
	let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"}}}

NeoBundle 'git@github.com:jelera/vim-template' "{{{
	let g:username = "Jose Elera"
	let g:email = "jelera@gmail.com"
"}}}

NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'godlygeek/tabular'
"}}}

"------------------+
" Autocompletion {{{
"------------------+
NeoBundle 'Shougo/neocomplete.vim' " {{{
	"Note: This option must set it in .vimrc(_vimrc). NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }
	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g> neocomplete#undo_completion()
	inoremap <expr><C-l> neocomplete#complete_common_string()
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#smart_close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y> neocomplete#close_popup()
	inoremap <expr><C-e> neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up> neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplete#enable_insert_char_pre = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
"}}}

"------------------+
" Colorschemes   {{{
"------------------+
NeoBundle 'git@github.com:jelera/vim-hybrid.git'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'NLKNguyen/papercolor-theme'
"}}}

"------------------+
" Navigation     {{{
"------------------+
NeoBundle 'mbbill/undotree' "{{{
	nnoremap <silent> <F5> :UndotreeToggle<CR>
"}}}

NeoBundle 'majutsushi/tagbar' "{{{
	nnoremap <silent> <F9> :TagbarToggle<CR>
	let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
	\ 'h:Heading_L1',
	\ 'i:Heading_L2',
	\ 'k:Heading_L3'
	\ ]
	\ }
	let g:tagbar_type_css = {
	\ 'ctagstype' : 'Css',
	\ 'kinds' : [
	\ 'c:classes',
	\ 's:selectors',
	\ 'i:identities'
	\ ]
	\ }
	let g:tagbar_type_ruby = {
	\ 'kinds' : [
	\ 'm:modules',
	\ 'c:classes',
	\ 'd:describes',
	\ 'C:contexts',
	\ 'f:methods',
	\ 'F:singleton methods'
	\ ]
	\ }
"}}}

"}}}

"------------------+
" Filetype       {{{
"------------------+
	" Python -----------------{{{
	NeoBundleLazy 'davidhalter/jedi-vim', {
		\ 'autoload': { 'filetypes': ['python'] },
	\ }
	let g:jedi#popup_on_dot=0
	NeoBundleLazy 'tmhedberg/SimpylFold', {
		\ 'autoload': { 'filetypes': ['python'] },
	\ }
	"}}}

	" JavaScript -------------{{{
	NeoBundleLazy 'git@github.com:jelera/vim-javascript-syntax.git', {'autoload':{'filetypes':['javascript']}}
	NeoBundleLazy 'JavaScript-Indent', {'autoload':{'filetypes':['javascript']}}
	NeoBundleLazy 'marijnh/tern_for_vim', {
	\ 'autoload': { 'filetypes': ['javascript'] }
	\ }
	"}}}

	" HTML/XML/CSS -----------{{{
	NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache']}}
	NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
	"}}}

	" Ruby -------------------{{{
	NeoBundle 'tpope/vim-rails'
	"}}}

	" Markdown ---------------{{{
	NeoBundle 'tpope/vim-markdown'
	"}}}

""}}}

"}}}

call neobundle#end()
filetype plugin indent on " Required!
NeoBundleCheck
"}}}


"----------------------------------------------------------------------------//
" BASIC CONFIGURATION                                                       {{{
"------------------------------------+---------------------------------------//
" General Options                  {{{
"------------------------------------+
set title
set hidden
syntax on
set nomodeline

" This will setup the user's shell
" $PATH to vim/gvim/macvim
exe "set path=".expand("$PATH")

" Backspace will delete EOL chars, as well as indents
set backspace=indent,eol,start

" For characters that forms pairs for using % commands, this is for HTML Tags
set matchpairs+=<:>

" Keywords are use to searching and recognized with many commands
" set the command line height
set cmdheight=2
set iskeyword+=_,$,@,%,#

" Set to autoread when a file is changed from the outside
set autoread

" Hide the mouse cursor when typing
set mousehide

" Reports always the amount of changed lines
set report=0

" marks: 1000 files, history lines: 1000 lines, search queries: 1000 patterns, registers: 1000
set viminfo='1000,f1,:1000,/1000,<1000,s100

" Swap directory to store temporary files
set directory=$HOME/.vimfiles/swapfiles,/var/tmp,/tmp,.
set history=1000
set undolevels=1000
set confirm
set shiftround
"}}}

"------------------------------------+
" Encoding                         {{{
"------------------------------------+
set encoding=utf-8
"}}}

"------------------------------------+
" Fileformats                      {{{
"------------------------------------+
" Read unix,mac,dos formatted files
set fileformats=unix,mac,dos

" The default format is UNIX
set fileformat=unix
"}}}

"------------------------------------+
" Undo Directory and files         {{{
"------------------------------------+
if version >= 730
	set undodir=$HOME/.vim/.cache/undo
	set undofile
	set undolevels=999
endif
"}}}

"------------------------------------+
" Define , as map leader           {{{
"------------------------------------+
let mapleader = ','
let g:mapleader = ','
"}}}

"------------------------------------+
" Disable all bells                {{{
"------------------------------------+
set noerrorbells visualbell t_vb=
"}}}

"------------------------------------+
" Wild menu (Autocompletion)       {{{
"------------------------------------+
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp
set wildmode=full
"}}}

"------------------------------------+
" Backup and Swap                  {{{
"------------------------------------+
" backups
set backup
set backupdir=~/.vim/.cache/backup

" swap files
set directory=~/.vim/.cache/swap
" set noswapfile
"}}}

"------------------------------------+
" Search Options                   {{{
"------------------------------------+
" Highlight search
set hlsearch

" Incremental search
set incsearch

" Searches are Non Case-sensitive
set ignorecase
set smartcase
"}}}

"------------------------------------+
" Conflict markers                 {{{
"------------------------------------+
" Highlight conflict markers"
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Shortcut to jump to next conflict marker"
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" Highlight problematic whitespace (spaces before tabs)
hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold guifg=red gui=bold
match RedundantSpaces / \+\ze\t/

"Mark Tabs not used for indentation in Code"
match errorMsg /[^\t]\zs\t+/
"}}}

"------------------------------------+
" Omnicompletion options           {{{
"------------------------------------+
set completeopt=menu,menuone,longest
"}}}

"------------------------------------+
" GREP / AG                        {{{
"------------------------------------+
" As seen in http://robots.thoughtbot.com/faster-grepping-in-vim/

" Use ag instead of grep
if executable('ag')
	set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
	set grepformat=%f:%l:%c:%m
endif

" Search the word under the cursor with K
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!"
nnoremap \ :Ag<SPACE>
"}}}

"}}}


"----------------------------------------------------------------------------//
" FOLDING                                                                   {{{
"----------------------------------------------------------------------------//
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0
set foldtext=FoldText()
"}}}


"----------------------------------------------------------------------------//
" USER INTERFACE                                                            {{{
"------------------------------------+---------------------------------------//
" Look and Feel settings           {{{
"------------------------------------+
set t_Co=256

" These customizations are for the Hybrid Colorscheme, for my readability {{{
" hi  FoldColumn   guifg=#a8a8a8 guibg=#444444 gui=NONE      ctermfg=248 ctermbg=238  cterm=NONE
" hi  Folded       guifg=#a8a8a8 guibg=#444444 gui=NONE      ctermfg=248 ctermbg=238  cterm=NONE
" hi  LineNr       guifg=#4e4e4e guibg=#000                  ctermfg=237 ctermbg=233
" hi  helpExample  guifg=#5faf00

" This piece highlights the border of 80 char"
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"}}}

colorscheme PaperColor

if has('gui_running')
" GVIM / MacVim"{{{
	set guioptions-=T
	set guioptions+=c
	" Font Selection
	if has('mac')
		" For MacVim
		set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline\:h9
	else
		" For Linux gVim
		set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline\ 9
endif
"}}}
else
" Terminal Vim"{{{
	if $COLORTERM == 'gnome-terminal'
		set t_Co=256 "why you no tell me correct colors?!?!
	endif
	if $TERM_PROGRAM == 'iTerm.app'
		" different cursors for insert vs normal mode
		if exists('$TMUX')
			let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
			let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
		else
			let &t_SI = "\<Esc>]50;CursorShape=1\x7"
			let &t_EI = "\<Esc>]50;CursorShape=0\x7"
		endif
	endif
"}}}
endif

if &diff
	colorscheme hybrid-light
endif
" }}}

"------------------------------------+
" Fillchars/listchars/showbreak    {{{
"------------------------------------+
set fillchars=vert:║
set listchars=tab:↹\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪⋯⋯
"}}}

"------------------------------------+
" General UI Options               {{{
"------------------------------------+
" Always show the statusline
set laststatus=2

" Show Line Numbers, together wih relativenumber
set number
set relativenumber

" Width value of the Line Number Column
set numberwidth=4
set ruler

" Tenths of a second to show matching parentheses
set matchtime=2

" Shows matching brackets when text indicator is over them
set showmatch

" Show 5 lines of context around the cursor
set scrolloff=5
set sidescrolloff=20

" The screen won't be redrawn unless actions took place
set lazyredraw

" When moving thru the lines, the cursor will try to stay in the previous columns
set nostartofline

set cursorline
set showcmd
set pumheight=10
set diffopt+=context:3
"}}}
"}}}


"----------------------------------------------------------------------------//
" LAYOUT / TEXT FORMATTING                                                  {{{
"------------------------------------+---------------------------------------//
" Formatting Options               {{{
"------------------------------------+
" Soft Wrap in all files,
" while hard wrap can be allowed by filetype
set wrap

" It maintains the whole words when wrapping
set linebreak

" set formatoptions=croqwanl1
" c = auto wrap comments using textwidth
" r = Auto insert the comment leader after hitting ENTER in insert mode
" o = Auto insert the comment leader after hitting 'o' or 'O' in insert mode
" q = Allows formatting of comments with "gq"
" w = Trailing whitespace indicates a new line continues in the next line
" a = Auto formatting of paragraphs.
" n = Recognize numbered lists
" l = long lines are not broken in insert mode
" 1 = Don't break a line after a one-letter word

" This is the width of the text after the filter (par) goes thru the file
" set textwidth=79
" }}}

"------------------------------------+
" Indentation                      {{{
"------------------------------------+
set autoindent
set cindent
set smartindent
"}}}

"------------------------------------+
" Tab Options                      {{{
"------------------------------------+
set shiftwidth=4
set tabstop=4
set smarttab
set noexpandtab
"}}}

"}}}


"----------------------------------------------------------------------------//
" MAPPINGS                                                                  {{{
"------------------------------------+---------------------------------------//
" General                          {{{
"------------------------------------+
" Clear search highlighting
nnoremap <silent> <Leader><space> :nohlsearch<CR>

" Show Invisible Characters
nmap <Leader>l :set list!<CR>

" Toggle Foldings with the space bar
nnoremap <Space> za

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vmap > >gv
vmap < <gv
vmap = =gv

" Show syntax highlighting groups for word under cursor
nnoremap <Leader>syn :call <SID>SynStack()<CR>

" Quick Highlight of the selected searched word
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.2)<cr>
"}}}

"------------------------------------+
" Editing                          {{{
"------------------------------------+
" Strip trailing whitespace
nnoremap <leader>nw :%s/\s\+$//e<cr>:let @/=''<CR>

" Autocomplete {} indent and reposition of the cursor in the middle
inoremap <silent> <CR> <C-R>=EnterIndent()<CR>

" Expand Compressed HTML with Tidy
map <leader>td :%!tidy -q -config ~/.vim/tidy.conf --tidy-mark 0 2>/dev/null<CR><ESC>gg=G

" Documentation Writing and Formatting
map <leader>h1 yypVr=o
map <leader>h2 yypVr-o
"}}}

"------------------------------------+
" Copy, Cut, Paste and Blockwise   {{{
"------------------------------------+
" Use CTRL-Q to do what CTRL-V used to do, Blockwise Visual Selection
noremap <C-Q>   <C-V>

" CTRL-X is cut
vnoremap <C-X> "+x

" CTRL-C is copy
vnoremap <C-C> "+y

" Smart Paste CTRL-V from the system's clipboard and indents code automatically
nnoremap <C-V> "+P=']
inoremap <C-V> <C-o>"+P<C-o>=']
"}}}

"------------------------------------+
" Spell Checking                   {{{
"------------------------------------+
" American English spelling by default
set spelllang=en_us

" Spanish spelling
nnoremap <Leader>spa :bufdo set spelllang=es<CR>

" Faster spell correction (based on the first occurrance)
inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <c-f> [s1z=<c-o>

" Toggle spell checking
nnoremap <leader>spl :setlocal spell!<cr>

" Spell checking in Mail textfiles (mutt)
au FileType mail,text,markdown au BufEnter,BufWinEnter <buffer> setlocal spell
"}}}

"}}}


"----------------------------------------------------------------------------//
" ABBREVIATIONS                                                             {{{
"------------------------------------+---------------------------------------//
" Date Abbreviations              "{{{
"------------------------------------+
" adate : Dec 06, 2013
" xdate : Fri, 06 Dec 2013 21:52:35 PM CDT
" rdate : Fri, 06 Dec 2013 21:52:35 -0600
" ldate : 2013-12-06 21:52:52
" sdate : 2013-12-06

" RFC822 date format"
iab <expr> rdate strftime("%a, %d %b %Y %H:%M:%S %z")
iab <expr> xdate strftime("%a %d %b %Y %I:%M:%S %p %Z")

" American date format"
iab adate <C-R>=strftime("%b %d, %Y")<cr>

" Short date format YYYY-MM-DD
iab ldate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab sdate <C-R>=strftime("%Y-%m-%d")<cr>
"}}}

"------------------------------------+
" Common typing mistakes          "{{{
"------------------------------------+
iab retunr return
iab Flase False
iab sefl self
iab pritn print
iab prnt print

iab Whta What
iab whta what

iab becuase because
iab becuas because
"}}}

"------------------------------------+
" Programming Abbreviations       "{{{
"------------------------------------+
iab #e   #!/usr/bin/env
iab #pl  #!/usr/bin/env perl
iab #py  #!/usr/bin/env python
iab #py3 #!/usr/bin/env python3
iab #rb  #!/usr/bin/env ruby
iab #sh  #!/usr/bin/env bash
"}}}

"------------------------------------+
" Signatures                      "{{{
"------------------------------------+
iab ssig Jose Elera
iab lsig Jose Elera (https://github.com/jelera)
"}}}

"------------------------------------+
" Placeholders                    "{{{
"------------------------------------+
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sollicitudin quam eget libero pulvinar id condimentum velit sollicitudin. Proin cursus scelerisque dui ac condimentum. Nullam quis tellus leo. Morbi consectetur, lectus a blandit tincidunt, tortor augue tincidunt nisi, sit amet rhoncus tortor velit eu felis.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
"}}}

"}}}


"----------------------------------------------------------------------------//
" AUTOCOMMANDS                                                              {{{
"------------------------------------+---------------------------------------//
augroup Code Comments             "{{{
"------------------------------------+
	" Horizontal Rule (78 char long)
	autocmd FileType vim                           map <leader>hr 0i""---------------------------------------------------------------------------//<ESC>
	autocmd FileType javascript,php,c,cpp,css      map <leader>hr 0i/**-------------------------------------------------------------------------**/<ESC>
	autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>hr 0i##---------------------------------------------------------------------------//<ESC>
	" Comment Banners (adds 5 spaces at each end)
	autocmd FileType vim                           map <leader>cb I"     <ESC>A     "<ESC>yyp0lv$hhr-yykPjj
	autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>cb I#     <ESC>A     #<ESC>yyp0lv$hhr-yykPjj
	autocmd FileType javascript,php,c,cpp,css      map <leader>cb I/*     <ESC>A     */<ESC>yyp0llv$r-$hc$*/<ESC>yykPjj


augroup END "}}}

"------------------------------------+
augroup General                   "{{{
"------------------------------------+
	autocmd!
	" Help file settings
	au FileType help au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()
	au FileType help au BufEnter,BufWinEnter <buffer> setlocal spell!

	" Fix space highlighting in diff files
	au FileType diff hi clear RedundantSpaces
				\ | hi DiffCol ctermbg=238 cterm=bold
				\ | match DiffCol /^[ +-]\([+-]\)\@!/

	" Save on losing focus (after tabbing away or switching buffers)
	au FocusLost * :wa

	" Open in last edit place
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

	" Autoupdate the timestamp when saving the file
	autocmd! BufWritePre * :call s:UpdateTimestamp()
augroup END " }}}

"------------------------------------+
augroup Formatting                "{{{
"------------------------------------+
	autocmd!
	" Fix gitcommit formatting
	autocmd FileType gitcommit setl spell textwidth=72

	" Format plain text and e-mails correctly
	autocmd BufNewFile,BufRead *.txt setl ft=text
	autocmd FileType mail,text setl formatoptions+=t formatoptions-=l textwidth=72 colorcolumn=72
augroup END "}}}

"------------------------------------+
augroup Whitespace                "{{{
"------------------------------------+
	autocmd!
	" Remove trailing whitespace from selected filetypes
	au FileType html,css,sass,javascript,php,python,ruby,sql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()
augroup END "}}}

"------------------------------------+
augroup Filetype Specific         "{{{
"------------------------------------+
	autocmd!
	"------------------+
	" Markdown       {{{
	"------------------+
	au FileType markdown setlocal textwidth=80

	" Markdown to HTML
	if executable('markdown')
		au FileType markdown nnoremap <silent> <leader>md :%!markdown 2>/dev/null<CR>
	endif

	" Markdown formatting
	au FileType markdown setlocal autoindent formatoptions=tcroqn2 comments=n:>
	" }}}

	"------------------+
	" HTML/XHTML     {{{
	"------------------+
	" for HTML, generally format text, but if a long line has been created
	" leave it alone when editing:
	autocmd FileType html,xhtml setlocal formatoptions+=tl
	autocmd FileType html,xhtml setlocal textwidth=0
	autocmd FileType html,xhtml setlocal noexpandtab tabstop=3 shiftwidth=3

	" Load the Current buffer in default web browser of Firefox
	au Filetype html,xhtml nmap <silent> <leader>pv : call PreviewInBrowser()<CR>
	" }}}

	"------------------+
	" Javascript     {{{
	"------------------+
	au BufNewFile,BufRead *.jsm setlocal ft=javascript
	au BufNewFile,BufRead Jakefile setlocal ft=javascript
	au FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	au FileType javascript setlocal nocindent

	" JSON syntax
	au BufRead,BufNewFile *.json setlocal ft=json

	" Expand compressed (minified) Javascript with JSBeautify.vim
	au FileType javascript nmap <leader>jsb : call g:Jsbeautify()<CR>
	" }}}

	"------------------+
	" CSS            {{{
	"------------------+
	autocmd FileType css setlocal smartindent
	autocmd FileType css setlocal noexpandtab tabstop=2 shiftwidth=2
	autocmd FileType css map <leader>css %s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/
	" autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true
	" }}}

	"------------------+
	" LESS           {{{
	"------------------+
	au BufNewFile,BufRead *.less setl ft=less
	" }}}

	"------------------+
	" SASS           {{{
	"------------------+
	au FileType sass SyntasticDisable
	" }}}

	"------------------+
	" PHP            {{{
	"------------------+
	let g:php_folding = 1
	let g:DisableAutoPHPFolding = 1
	let g:php_html_in_strings = 1
	let g:php_parent_error_close = 1
	let g:php_parent_error_open = 1
	let g:php_no_shorttags = 1
	au FileType php setlocal foldtext=FoldText() | setl foldtext=FoldText_PHP()
	" }}}

	"------------------+
	" Ruby           {{{
	"------------------+
	au FileType ruby setlocal ts=2 sts=2 sw=2 noexpandtab
	" }}}

	"------------------+
	" Python         {{{
	"------------------+
	au FileType python setlocal nocindent
	au BufNewFile,BufRead *.jinja setlocal syntax=htmljinja
	au BufNewFile,BufRead *.mako setlocal ft=mako
	" }}}

	"------------------+
	" Perl           {{{
	"------------------+
	au FileType perl setlocal makeprg=perl\ -W\ %
	" Sample errors:
	" Type of arg 1 to push must be array (not hash element) at NFrame.pm line 129, near ");"
	" Useless use of a constanst at test.pl line 5.
	au FileType perl setlocal errorformat=%m\ at\ %f\ line\ %l%.%#,
				\%-G%.%# " ignore any lines that didn't match one of the patterns above
	"}}}

	"------------------+
	" Nginx          {{{
	"------------------+
	au BufNewFile,BufRead /etc/nginx/conf/* setl ft=nginx
	" }}}

	"------------------+
	" Arch Linux     {{{
	"------------------+
	au BufNewFile,BufRead PKGBUILD setl syntax=sh ft=sh
	au BufNewFile,BufRead *.install setl syntax=sh ft=sh
	" }}}

	"------------------+
	" SQL            {{{
	"------------------+
	au BufNewFile,BufRead *.sql set ft=sql foldmethod=marker

	" http://stepanoff.org/wordpress/archives/1536
	" Select Database
	map <leader>db :call SwitchDB()<CR>

	" Run SQL Query
	map <leader>sql :call DoQuery()<CR>
	" }}}

augroup END "}}}
"}}}


"----------------------------------------------------------------------------//
" HELPER FUNCTIONS                                                          {{{
"----------------------------------------------------------------------------//
function! FoldText_PHP() "{{{
	" This function uses code from phpfolding.vim
	let l:curline = v:foldstart
	let l:line = getline(l:curline)

	" Did we fold a DocBlock? {{{
	if strridx(l:line, '#@+') != -1
		if (matchstr(l:line, '^.*#@+..*$') == l:line)
			let l:line = substitute(l:line, '^.*#@+', '', 'g') . ' ' . g:phpDocBlockIncludedPostfix
		else
			let l:line = getline(l:curline + 1) . ' ' . g:phpDocBlockIncludedPostfix
		endif
	" }}}

	" Did we fold an API comment block? {{{
	elseif strridx(l:line, "\/\*\*") != -1
		let s:state = 0

		while l:curline < v:foldend
			let l:loopline = getline(l:curline)

			if s:state == 0 && strridx(l:loopline, "\*\/") != -1
				let s:state = 1
			elseif s:state == 1 && (matchstr(l:loopline, '^\s*$') != l:loopline)
				break
			endif

			let l:curline = l:curline + 1
		endwhile

		let l:line = getline(l:curline)
	endif
	" }}}

	" Cleanup {{{
	let l:line = substitute(l:line, '/\*\|\*/\d\=', '', 'g')
	let l:line = substitute(l:line, '^\s*\*\?\s*', '', 'g')
	let l:line = substitute(l:line, '{$', '', 'g')
	let l:line = substitute(l:line, '($', '(...)', 'g')
	" }}}

	" Append postfix if there is PhpDoc in the fold {{{
	if l:curline != v:foldstart
		let l:line = l:line . " " . g:phpDocIncludedPostfix . " "
	endif
	" }}}

	return FoldText(l:line)
endfunction "}}}

function! FoldText(...) "{{{
	" This function uses code from doy's vim-foldtext:
	" https://github.com/doy/vim-foldtext

	" Prepare fold variables {{{

	" Use function argument as line text if provided
	let l:line = a:0 > 0 ? a:1 : getline(v:foldstart)
	let l:line_count = v:foldend - v:foldstart + 1
	let l:indent = repeat(' ', indent(v:foldstart))
	let l:w_win = winwidth(0)
	let l:w_num = getwinvar(0, '&number') * getwinvar(0, '&numberwidth')
	let l:w_fold = getwinvar(0, '&foldcolumn')
	" }}}

	" Handle diff foldmethod {{{
	if &fdm == 'diff'
		let l:text = printf(' ⋆ %s matching lines ⋆ ', l:line_count)

		" Center-align the foldtext
		return repeat('=', (l:w_win - strchars(l:text) - l:w_num - l:w_fold) / 2) . l:text
	endif
	" }}}

	" Handle other foldmethods {{{
	let l:text = l:line

		" Remove foldmarkers {{{
		let l:foldmarkers = split(&foldmarker, ',')
		let l:text = substitute(l:text, '\V' . l:foldmarkers[0] . '\%(\d\+\)\?\s\*', '', '')
		" }}}

		" Remove comments {{{
		let l:comment = split(&commentstring, '%s')
		if l:comment[0] != ''
			let l:comment_begin = l:comment[0]
			let l:comment_end = ''
			if len(l:comment) > 1
				let l:comment_end = l:comment[1]
			endif
			let l:pattern = '\V' . l:comment_begin . '\s\*' . l:comment_end . '\s\*\$'
			if l:text =~ l:pattern
				let l:text = substitute(l:text, l:pattern, ' ', '')
			else
				let l:text = substitute(l:text, '.*\V' . l:comment_begin, ' ', '')
				if l:comment_end != ''
					let l:text = substitute(l:text, '\V' . l:comment_end, ' ', '')
				endif
			endif
		endif
		" }}}

		" Remove preceding non-word characters {{{
		let l:text = substitute(l:text, '^\W*', '', '')
		" }}}

		" Remove surrounding whitespace {{{
		let l:text = substitute(l:text, '^\s*\(.\{-}\)\s*$', '\1', '')
		" }}}

		" Make unmatched block delimiters prettier {{{
		let l:text = substitute(l:text, '([^)]*$',   '( ... )', '')
		let l:text = substitute(l:text, '{[^}]*$',   '{ ... }', '')
		let l:text = substitute(l:text, '\[[^\]]*$', '[ ... ]', '')
		" }}}

		" Add arrows when indent level > 2 spaces {{{
		if indent(v:foldstart) > 2
			let l:cline = substitute(l:line, '^\s*\(.\{-}\)\s*$', '\1', '')
			let l:clen = strlen(matchstr(l:cline, '^\W*'))
			let l:indent = repeat(' ', indent(v:foldstart) - 2)
			let l:text = '▪︎' . l:text
		endif
		" }}}

		" Prepare fold text {{{
		let l:fnum = printf(' [ Lines: %s ]           ', l:line_count)
		let l:ftext = printf('‣  %s%s ', l:indent, l:text)
		" }}}

	return l:ftext . repeat(' ', l:w_win - strchars(l:fnum) - strchars(l:ftext) - l:w_num - l:w_fold) . l:fnum . ' '

	" }}}

endfunction "}}}

function! DoQuery() "{{{
	if !exists("g:current_db")
		call SwitchDB()
	endif
	let query_string = input(g:current_db . " > " )
	if query_string != ""
		exe "!mysql " . g:current_db . " -e \"" . escape(query_string, '"') . "\""
	endif
endfunction "}}}

function! SwitchDB() "{{{
	let g:current_db = input("Database > ")
endfunction "}}}

function! PreviewInBrowser() "{{{
	if has("mac")
		"exec "!open %"
		exec "!open -a /Applications/Firefox.app/ %"
		"exec "!open -a firefox.app %:p"
	else
		exec "!firefox %"
	endif
endfunction "}}}

function! <SID>StripTrailingWhitespace() "{{{
	" Preparation: save the last search, and curson position"
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business"
	%s/\s\+$//e
	"Clean up: restore previous search history and cursor position"
	let @/=_s
	call cursor(l, c)
endfunction "}}}

function! s:UpdateTimestamp() "{{{
	let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
	let rep = '\1' . strftime("%a %d %b %Y %I:%M:%S %p %Z")
	call s:subst(1, 20, pat, rep)
endfunction "}}}

function! s:subst(start, end, pat, rep) "{{{
	let lineno = a:start
	while lineno <= a:end
		let curline = getline(lineno)
		if match(curline, a:pat) != -1
			let newline = substitute( curline, a:pat, a:rep, '' )
			if( newline != curline )
				" Only substitute if we made a change
				"silent! undojoin
				keepjumps call setline(lineno, newline)
			endif
		endif
		let lineno = lineno + 1
	endwhile
endfunction "}}}

function! s:SetupHelpWindow() "{{{
	wincmd L
	vertical resize 79
	setl nonumber winfixwidth colorcolumn=
endfunction "}}}

function! <SID>SynStack() "{{{
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction "}}}

function! EnterIndent() "{{{
	" Taken from https://github.com/acustodioo/vim-enter-indent
	let EnterIndentActive = [
				\ {'left' : '[\{\[\(]','right' : '[\)\]\}]'},
				\ {'left' : '<[^>]*>', 'right' : '</[^>]*>'},
				\ {'left' : '<?\(php\)\?', 'right' : '?>'},
				\ {'left' : '<%', 'right' : '%>'},
				\ {'left' : '\[[^\]]*\]', 'right' : '\[/[^\]]*\]'},
				\ {'left' : '<!--', 'right' : '-->'},
				\ {'left' : '\(#\)\?{[^\}]*\}', 'right' : '\(#\)\?{[^\}]*\}'},
				\ ]

	let GetLine = getline('.')
	let ColNow = col('.') - 1

	let RightGetLine = substitute(
				\ strpart(GetLine, ColNow, col('$')),
				\ '^[ ]*', '', ''
				\ )

	if RightGetLine == "" | call feedkeys("\<CR>", 'n') | return '' | endif

	for value in EnterIndentActive
		if matchstr(RightGetLine, '^' . value.right) != ""
			let EnterIndentRun = 1 | break
		endif
	endfor

	if !exists('EnterIndentRun') | call feedkeys("\<CR>", 'n') | return '' | endif

	let LeftGetLine = substitute(
				\ strpart(GetLine, 0, ColNow),
				\ '[ ]*$', '', ''
				\ )

	if matchstr(LeftGetLine, value.left . '$') == ""
		call feedkeys("\<CR>", 'n') | return ''
	endif

	let LineNow = line('.')
	let Indent = substitute(LeftGetLine, '^\([ |\t]*\).*$', '\1', '')

	call setline(LineNow, LeftGetLine)
	call append(LineNow, Indent . RightGetLine)
	call append(LineNow, Indent)
	call feedkeys("\<Down>\<Esc>\A\<Tab>", 'n')

	return ''
endfunction "}}}

function! HLNext (blinktime) "{{{
	highlight WhiteOnRed ctermfg=white ctermbg=red
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	let target_pat = '\c\%#'.@/
	let ring = matchadd('WhiteOnRed', target_pat, 101)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction "}}}

function! GetCwd() "{{{
	let currentdir = substitute(getcwd(), expand("$home"), "~", "g")
	return currentdir
endfunction "}}}

function! GetFileSize() "{{{
	let bytes = getfsize(expand("%:p"))
	if bytes <= 0
		return ""
	endif
	if bytes < 1024
		return "[" . bytes . " b]"
	else
		return "[" . (bytes / 1024) . " kb]"
	endif
endfunction "}}}
" }}}
