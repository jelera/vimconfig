scriptencoding utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               /\/|  __              _
"              |/\/  / /     __   __ (_)  _ __ ___  _ __ ___
"                   / /      \ \ / / | | | '_ ` _ \| '__/ __|
"                  / /    _   \ V /  | | | | | | | | | | (__
"                 /_/    (_)   \_/   |_| |_| |_| |_|_|  \___|
"
"   Maintainer: Jose Elera (https://github.com/jelera)
"               http://jelera.github.io
"
" Last Updated: Wed 11 Mar 2020 01:14:16 PM CDT
"
"   Disclaimer: You are welcome to take a look at my .vimrc and take ideas in
"               how to customize your Vim experience; though I encourage you
"               to experiment with your own mappings, plugins and configs.
"
"      License: MIT
"               Copyright (c) 2020 Jose Elera
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
" VIM-PLUG AND 3RD-PARTY PLUGINS                                           {{{
"----------------------------------------------------------------------------//
" vint: -ProhibitSetNoCompatible
set nocompatible

let mapleader = ','
let g:mapleader = ','

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"------------------------------------+
" Plugins (settings and mappings)  {{{
"------------------+-----------------+
" UI/Usability   {{{
"------------------+
Plug 'vim-airline/vim-airline' "{{{
	" Lean and mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'
	" Themes for airline
	let g:airline_mode_map = {
				\ '__'     : '-',
				\ 'c'      : 'C',
				\ 'i'      : 'Ins',
				\ 'ic'     : 'Ins',
				\ 'ix'     : 'Ins',
				\ 'n'      : 'Nrm',
				\ 'multi'  : 'M',
				\ 'ni'     : 'N',
				\ 'no'     : 'N',
				\ 'R'      : 'R',
				\ 'Rv'     : 'R',
				\ 's'      : 'S',
				\ 'S'      : 'S',
				\ ''     : 'S',
				\ 't'      : 'T',
				\ 'v'      : 'Visual',
				\ 'V'      : 'Visual',
				\ ''     : 'Visual Blk',
				\ }
	let g:airline_powerline_fonts = 1
	let g:airline_skip_empty_sections = 1
	let g:airline#extensions#branch#format = 1
	let g:airline_theme = 'sol'
	let g:airline_section_z = "\uE0A1 %l:%c %p%%|%L"
	let g:airline#extensions#ale#enabled = 1
	let airline#extensions#ale#error_symbol = '❗ '
	let airline#extensions#ale#warning_symbol = '⚠️  '
	let airline#extensions#ale#open_lnum_symbol = " [\uE0A1 "
	let airline#extensions#ale#close_lnum_symbol = '] '
	let g:airline#extensions#coc#enabled = 0
	let g:airline#extensions#languageclient#enabled = 0
"}}}

Plug 'Yggdroot/indentLine' "{{{
	" It displays the indentation level with thin vertical lines
	let g:indentLine_char_list = ['┊']
	let g:indentLine_enabled = 1
"}}}

Plug 'tpope/vim-surround' "{{{
	" Easily delete, changes and adds surrounding pairs, such as parentheses,
	" brackets, quotes, XML tags and more.
"}}}

Plug 'tpope/vim-unimpaired' "{{{
	" Sensible mappings for commonly used ex commands
"}}}

Plug 'tpope/vim-repeat' "{{{
	" Enables repeating supporting plugin maps with the dot (.) command
"}}}

Plug 'tpope/vim-projectionist' "{{{
	" Provides granular project configuration using 'Projections'
"}}}

Plug 'mhinz/vim-startify' "{{{
	" Fancy start screen with MRU files
"}}}

Plug 'junegunn/goyo.vim' "{{{
	" Distraction-free writing in Vim
"}}}

Plug 'Valloric/ListToggle' "{{{
	" Toggles the display of the QuickFix and the Location list
	" Mappings:
	" <leader>l for toggling the Location List
	" <leader>q for toggling the QuickFix
"}}}
"}}}

Plug 'SirVer/ultisnips' "{{{
	" The Ultimate snippet solution for Vim
	let g:UltiSnipsExpandTrigger='<c-s>'
	let g:UltiSnipsJumpForwardTrigger='<c-s>n'
	let g:UltiSnipsJumpBackwardTrigger='<c-s>p'
"}}}

Plug 'honza/vim-snippets' "{{{
	" A community-maintained snippet repository for several languages and
	" frameworks
"}}}

Plug 'epilande/vim-es2015-snippets' "{{{
	" Snippets for ES2015
"}}}

Plug 'epilande/vim-react-snippets' "{{{
	" Snippets for React
"}}}


"------------------+
" Autocompletion {{{
"------------------+
Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
	" Full LSP support and autocomplete for Vim
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes
	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
	" plugin.
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Navigate snippet placeholders using tab
	let g:coc_snippet_next = '<Tab>'
	let g:coc_snippet_prev = '<S-Tab>'

	"Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position.
	" " Coc only does snippet and additional edit on confirm.
	" inoremap <C-R>=pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" " Or use `complete_info` if your vim support it, like:

	nmap <silent> gd <Plug>(coc-definition)
	" nnoremap <silent> gr <Plug>(coc-references)
	" nnoremap <silent> gj <Plug>(coc-implementation)

	" let g:coc_global_extensions = ['coc-solargraph']
	" SNIPPETS
	" " Use <C-l> for trigger snippet expand.
	" imap <C-l> <Plug>(coc-snippets-expand)

	" " Use <C-j> for select text for visual placeholder of snippet.
	" vmap <C-j> <Plug>(coc-snippets-select)

	" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
	" let g:coc_snippet_next = '<c-j>'

	" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	" let g:coc_snippet_prev = '<c-k>'

	" " Use <C-j> for both expand and jump (make expand higher priority.)
	" imap <C-j> <Plug>(coc-snippets-expand-jump)
"}}}
"}}}

"------------------+
" Text helpers   {{{
"------------------+
Plug 'vim-scripts/matchit.zip' "{{{
	" Extends the existing functionality of the % command, matching also
	" parentheses, square and curly brackets, as well as conditional statements.
"}}}

Plug 'tpope/vim-fugitive' "{{{
	" Provides a nice interface and extra commands for Git
"}}}

Plug 'rhysd/committia.vim' "{{{
	" Provides a more pleasant editing on Git commit messages
"}}}

Plug 'dense-analysis/ale' " {{{
	" Provides real-time async linting
	let g:ale_sign_column_always = 1
	let g:ale_sign_error = '❗ '
	let g:ale_sign_warning = '⚠️  '
	let g:ale_set_highlights = 0
	let g:ale_echo_msg_error_str = '❗'
	let g:ale_echo_msg_warning_str = '⚠️ '
	let g:ale_echo_msg_format = '[%linter%] %severity% %s'

	let g:ale_fixers = {
				\ '*': ['remove_trailing_lines', 'trim_whitespace'],
				\ 'javascript': ['prettier', 'eslint'],
				\ 'javascript.jsx': ['prettier', 'eslint'],
				\ 'html': ['prettier'],
				\ 'css': ['prettier']
	\}

	let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

	let g:ale_linters = {
				\ 'javascript': ['eslint'],
				\ 'jsx' : ['eslint'],
				\ 'ruby' : ['rubocop']
	\}
	let g:ale_lint_on_save = 1
	let g:ale_fix_on_save = 1
"}}}

Plug 'tpope/vim-commentary' "{{{
	" Adds a new command 'gc' for commenting out lines of text
"}}}

Plug 'tpope/vim-endwise' "{{{
	" Wisely add 'end' or (equivalent) in Ruby, Shell Scripting, Elixir, Lua,
	" Haskell, etc.

	" disable mapping to not break coc.nvim
	let g:endwise_no_mappings = 1
"}}}

Plug 'tmux-plugins/vim-tmux-focus-events' "{{{
	" FocusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux.

	" Here's where that matters:

	" vim-fugitive plugin uses FocusGained for refreshing git branch in status line
	" vim-gitgutter uses FocusGained for refreshing ... (wait for it) git gutter
	" vim-tmux-clipboard uses FocusGained and FocusLost for refreshing clipboard.
"}}}

Plug 'christoomey/vim-tmux-navigator' "{{{
	" Seemless navigation between tmux panes and vim splits
"}}}

Plug 'jiangmiao/auto-pairs' "{{{
	" Inserts or deletes brackets, parentheses, quotes in pairs
"}}}

Plug 'alvan/vim-closetag' "{{{
	" Autoclose HTML/XML tags
	let g:closetag_filetypes = 'html,xhtml,erb,jsx'
"}}}

Plug 'valloric/MatchTagAlways' "{{{
" Always highlights the enclosing HTML/XML tags
	let g:mta_filetypes = {
				\ 'javascript.jsx' : 1,
				\ 'erb' : 1
				\}
"}}}

Plug 'janko/vim-test' "{{{
	let test#strategy = 'vimterminal'
	nnoremap <silent> <leader>tf :TestFile<CR>
	nnoremap <silent> <leader>tl :TestLast<CR>
	nnoremap <silent> <leader>tn :TestNearest<CR>
	nnoremap <silent> <leader>ts :TestSuite<CR>
"}}}

"}}}

"------------------+
" Colorschemes   {{{
"------------------+
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
"}}}

"------------------+
" Navigation     {{{
"------------------+
Plug 'liuchengxu/vista.vim' "{{{
	" Tag and LSP symbols viewer
"}}}

" Plug 'majutsushi/tagbar' "{{{
" 	" nnoremap <silent> <leader><leader>t :TagbarToggle<CR>
" 	" let g:tagbar_ctags_bin = '/usr/bin/ctags'
" 	let g:tagbar_type_markdown = {
" 	\ 'ctagstype' : 'markdown',
" 	\ 'kinds' : [
" 		\ 'h:Heading_L1',
" 		\ 'i:Heading_L2',
" 		\ 'k:Heading_L3'
" 	\ ]
" 	\ }
" 	let g:tagbar_type_css = {
" 	\ 'ctagstype' : 'Css',
" 	\ 'kinds' : [
" 		\ 'c:classes',
" 		\ 's:selectors',
" 		\ 'i:identities'
" 	\ ]
" 	\ }
" 	let g:tagbar_type_javascript = {
" 	      \ 'ctagstype': 'javascript',
" 	      \ 'ctagsbin': 'jsctags',
" 	      \ 'kinds': [
" 	      \ 'A:arrays',
" 	      \ 'P:properties',
" 	      \ 'T:tags',
" 	      \ 'O:objects',
" 	      \ 'G:generator functions',
" 	      \ 'F:functions',
" 	      \ 'C:constructors/classes',
" 	      \ 'M:methods',
" 	      \ 'V:variables',
" 	      \ 'I:imports',
" 	      \ 'E:exports',
" 	      \ 'S:styled components'
"       	\ ]}
" 	let g:tagbar_type_ruby = {
" 	\ 'kinds' : [
" 		\ 'm:modules',
" 		\ 'c:classes',
" 		\ 'd:describes',
" 		\ 'C:contexts',
" 		\ 'f:methods',
" 		\ 'F:singleton methods'
" 	\ ]
" 	\ }
" 	if executable('ripper-tags')
" 	  let g:tagbar_type_ruby = {
" 	      \ 'kinds'      : ['m:modules',
" 			      \ 'c:classes',
" 			      \ 'C:constants',
" 			      \ 'F:singleton methods',
" 			      \ 'f:methods',
" 			      \ 'a:aliases'],
" 	      \ 'kind2scope' : { 'c' : 'class',
" 			       \ 'm' : 'class' },
" 	      \ 'scope2kind' : { 'class' : 'c' },
" 	      \ 'ctagsbin'   : 'ripper-tags',
" 	      \ 'ctagsargs'  : ['-f', '-']
" 	      \ }
" 	endif
" 	let g:tagbar_type_typescript = {
" 	  \ 'ctagsbin' : 'tstags',
" 	  \ 'ctagsargs' : '-f-',
" 	  \ 'kinds': [
" 	    \ 'e:enums:0:1',
" 	    \ 'f:function:0:1',
" 	    \ 't:typealias:0:1',
" 	    \ 'M:Module:0:1',
" 	    \ 'I:import:0:1',
" 	    \ 'i:interface:0:1',
" 	    \ 'C:class:0:1',
" 	    \ 'm:method:0:1',
" 	    \ 'p:property:0:1',
" 	    \ 'v:variable:0:1',
" 	    \ 'c:const:0:1',
" 	  \ ],
" 	  \ 'sort' : 0
" 	\ }
"}}}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "{{{
	" Interactive fuzzy finder
	Plug 'junegunn/fzf.vim'
	nnoremap <silent> <C-P> :FZF<Enter>
	" Ripgrep support with FZF
	nnoremap <silent> \ :Rg<CR>
"}}}

Plug 'preservim/nerdtree' "{{{
	" Tree file system explorer for Vim

	augroup NerdTree
		" autocmd BufWinEnter * NERDTreeFind
		autocmd StdinReadPre * let s:std_in=1
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	augroup END

	nnoremap <C-T> :NERDTreeToggle<Enter>
	nnoremap <leader>t :NERDTreeFind<Enter>
	let NERDTreeQuitOnOpen = 1
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
"}}}

"------------------+
" Filetype       {{{
"------------------+
	" JavaScript, JSON, ES6, JSX -------------{{{
	Plug 'git@github.com:jelera/vim-javascript-syntax.git', { 'for': 'javascript' }
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'elzr/vim-json', { 'for': ['javascript', 'json', 'javascript.jsx'] }
	"}}}

	" HTML/XML/CSS -----------{{{
	Plug 'mattn/emmet-vim'
		let g:user_emmet_leader_key='<C-E>'
	Plug 'othree/html5.vim'
	"}}}


	" Ruby -------------------{{{
	Plug 'slim-template/vim-slim'
	Plug 'vim-ruby/vim-ruby'
	Plug 'vim-utils/vim-ruby-fold' "{{{
		let g:ruby_fold_lines_limit = 200
	"}}}
	Plug 'tpope/vim-rake'
	Plug 'tpope/vim-bundler'
	Plug 'tpope/vim-rails'
	"}}}

	" Markdown ---------------{{{
	Plug 'tpope/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

	" Python ---------------{{{
	Plug 'vim-python/python-syntax'
		let g:python_highlight_all = 1
	"}}}

""}}}


" This plugin has the last one to load
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

filetype plugin indent on " Required!

"}}}

"}}}

"}}}
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
set updatetime=100

" This will setup the user's shell
" $PATH to vim/gvim/macvim
exe 'set path='.expand('$PATH')

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
set undodir=$HOME/.vim/.cache/undo
set undofile
set undolevels=999
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
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
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
" set completeopt=menu,menuone,longest
set completeopt=menu,menuone,preview,noselect,noinsert

"}}}

"------------------------------------+
" GREP / AG                        {{{
"------------------------------------+
" As seen in http://robots.thoughtbot.com/faster-grepping-in-vim/

" Use ag instead of grep
" if executable('ag')
" 	set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
" 	set grepformat=%f:%l:%c:%m
" endif

" Search the word under the cursor with K
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!"
" nnoremap \ :Ag<SPACE>
"}}}

"}}}

"----------------------------------------------------------------------------//
" FOLDING                                                                   {{{
"----------------------------------------------------------------------------//
set foldenable
set foldmethod=marker
set foldlevel=99
set foldcolumn=0
set foldtext=FoldText()
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
	if &foldmethod ==? 'diff'
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
		if l:comment[0] !=? ''
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
				if l:comment_end !=? ''
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
"}}}

"----------------------------------------------------------------------------//
" USER INTERFACE                                                            {{{
"------------------------------------+---------------------------------------//
" Look and Feel settings           {{{
"------------------------------------+
" set t_Co=256
set termguicolors

" These customizations are for the Hybrid Colorscheme, for my readability {{{
" hi  FoldColumn   guifg=#a8a8a8 guibg=#444444 gui=NONE      ctermfg=248 ctermbg=238  cterm=NONE
" hi  Folded       guifg=#a8a8a8 guibg=#444444 gui=NONE      ctermfg=248 ctermbg=238  cterm=NONE
" hi  LineNr       guifg=#4e4e4e guibg=#000                  ctermfg=237 ctermbg=233
" hi  helpExample  guifg=#5faf00

" This piece highlights the border of 80 char"
" let &colorcolumn=join(range(81,999), ',')
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
"}}}

" let g:seoul256_background = 233
" colorscheme seoul256
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"set background=dark

if has('gui_running')
" GVIM / MacVim"{{{
	set guioptions-=T
	set guioptions+=c
	" Font Selection
	if has('mac')
		" For MacVim
		set guifont=Fira\ Code:h14
	else
		" For Linux gVim
		set guifont=Fira\ Code\ 12
endif
"}}}
else
" Terminal Vim"{{{
" set t_Co=256 "why you no tell me correct colors?!?!
" if $COLORTERM == 'gnome-terminal'
" 	set t_Co=256 "why you no tell me correct colors?!?!
" endif
" if $TERM_PROGRAM == 'iTerm.app'
" 	" different cursors for insert vs normal mode
" 	" if exists('$TMUX')
" 	" 	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" 	" 	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" 	" else
" 	" 	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" 	" 	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 	" endif
" endif
"}}}
endif

" hi  Comment  cterm=italic

" hi  javaScriptFuncKeyword ctermfg=175 cterm=italic
" hi  javaScriptFuncArg ctermfg=195
" hi  javaScriptFuncDef ctermfg=186 cterm=bold
" hi  javaScriptFuncExp ctermfg=186 cterm=bold

" Ruby
" hi  rubyClassName ctermfg=44 cterm=bold
" hi  rubyMethodName ctermfg=35 cterm=bold,italic
" hi  rubyBlockParameterList ctermfg=116
" hi  rubyMacro ctermfg=140 cterm=italic
" hi  rubyControl ctermfg=150 cterm=bold
" hi  rubyInstanceVariable ctermfg=175
" hi  rubyHelper ctermfg=214 cterm=bold,italic
" hi  rubyViewHelper ctermfg=185 cterm=bold,italic


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
" set relativenumber

" Width value of the Line Number Column
set numberwidth=4
set ruler

" Tenths of a second to show matching parentheses
" set matchtime=2

" Shows matching brackets when text indicator is over them
set showmatch

" Show 5 lines of context around the cursor
set scrolloff=5
set sidescrolloff=20

" The screen won't be redrawn unless actions took place
" set lazyredraw

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
set shiftwidth=2
set tabstop=2
set noexpandtab " Use tabs instead of spaces
set smarttab
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
" nnoremap <Leader>l :set list!<CR>

" Toggle Foldings with the space bar
nnoremap <Space> za

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

" Show syntax highlighting groups for word under cursor
nnoremap <Leader>syn :call <SID>SynStack()<CR>

function! <SID>SynStack() "{{{
	if !exists('*synstack')
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction "}}}

" Quick Highlight of the selected searched word
" This rewires n and N to do the highlighing...
" nnoremap <silent> n   n:call HLNext(0.2)<cr>
" nnoremap <silent> N   N:call HLNext(0.2)<cr>
"}}}

"------------------------------------+
" Editing                          {{{
"------------------------------------+
" Strip trailing whitespace
nnoremap <leader>nw :%s/\s\+$//e<cr>:let @/=''<CR>

" Documentation Writing and Formatting
noremap <leader>h1 yypVr=o
noremap <leader>h2 yypVr-o
"}}}

"------------------------------------+
" Copy, Cut, Paste and Blockwise   {{{
"------------------------------------+
" Use CTRL-Q to do what CTRL-V used to do, Blockwise Visual Selection
noremap <C-Q> <C-V>

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
" nnoremap <Leader>spa :bufdo set spelllang=es<CR>

" Faster spell correction (based on the first occurrance)
" inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
" nnoremap <c-f> [s1z=<c-o>

" Toggle spell checking
nnoremap <leader>spl :setlocal spell!<cr>

" Spell checking in Mail textfiles (mutt)
augroup Spelling plain text
	au FileType mail,text,markdown au BufEnter,BufWinEnter <buffer> setlocal spell
augroup END
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
" iab <expr> rdate strftime("%a, %d %b %Y %H:%M:%S %z")
" iab <expr> xdate strftime("%a %d %b %Y %I:%M:%S %p %Z")

" " American date format"
" iab adate <C-R>=strftime("%b %d, %Y")<cr>

" " Short date format YYYY-MM-DD
" iab ldate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<cr>
" iab sdate <C-R>=strftime("%Y-%m-%d")<cr>
"}}}

"------------------------------------+
" Common typing mistakes          "{{{
"------------------------------------+
iab retunr return
iab Flase False
iab sefl self
iab pritn print
iab prnt print
iab edn end
iab dfe def

iab Whta What
iab whta what

iab becuase because
iab becuas because
"}}}

"------------------------------------+
" Programming Abbreviations       "{{{
"------------------------------------+
iab #e   #!/usr/bin/env
iab #py  #!/usr/bin/python
iab #rb  #!/usr/bin/ruby
iab #sh  #!/bin/bash
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
	au FileType help au BufEnter,BufWinEnter <buffer> setlocal spell!
	au FileType help au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()

	function! s:SetupHelpWindow() "{{{
		wincmd L
		vertical resize 79
		setl nonumber winfixwidth colorcolumn=
	endfunction "}}}

	" Fix space highlighting in diff files
	au FileType diff hi clear RedundantSpaces
				\ | hi DiffCol ctermbg=238 cterm=bold
				\ | match DiffCol /^[ +-]\([+-]\)\@!/

	" Save on losing focus (after tabbing away or switching buffers)
	au FocusLost * :wa

	" Open in last edit place
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

	" Autoupdate the timestamp when saving the file
	" autocmd! BufWritePre * :call s:UpdateTimestamp()

	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

	function s:MkNonExDir(file, buf) "{{{
		" Creates a directory if there is none
		if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
			let dir=fnamemodify(a:file, ':h')
			if !isdirectory(dir)
				call mkdir(dir, 'p')
			endif
		endif
	endfunction "}}}
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

	function! <SID>StripTrailingWhitespace() "{{{
		" Preparation: save the last search, and curson position"
		let _s=@/
		let l = line('.')
		let c = col('.')
		" Do the business"
		" vint: -ProhibitCommandWithUnintendedSideEffect
		" vint: -ProhibitCommandRelyOnUser
		substitute('\s\+$', '', 'e')

		"Clean up: restore previous search history and cursor position"
		let @/=_s
		call cursor(l, c)
	endfunction "}}}
augroup END "}}}

"------------------------------------+
augroup Filetype Specific         "{{{
"------------------------------------+
	autocmd!
	"------------------+
	" Markdown       {{{
	"------------------+
	au FileType markdown setlocal textwidth=80

	" Markdown formatting
	au FileType markdown setlocal autoindent formatoptions=tcroqn2 comments=n:>
	" }}}

	"------------------+
	" HTML/XHTML     {{{
	"------------------+
	autocmd FileType html,xhtml setlocal textwidth=0
	autocmd FileType html,xhtml setlocal noexpandtab tabstop=3 shiftwidth=3
	" }}}

	"------------------+
	" JavaScript     {{{
	"------------------+
	au FileType javascript,javascript.jsx setlocal ts=2 sts=2 sw=2 noexpandtab

	" JSON syntax
	au BufRead,BufNewFile *.json setlocal ft=json
	" }}}

	"------------------+
	" CSS            {{{
	"------------------+
	autocmd FileType css setlocal smartindent
	autocmd FileType css setlocal noexpandtab tabstop=2 shiftwidth=2
	autocmd FileType css map <leader>css %s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/
	autocmd FileType css setlocal equalprg=prettier\ --parser\ css\ --stdin\ --tab-width\ 2
	" }}}

	"------------------+
	" Ruby           {{{
	"------------------+
	au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	au FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
	" }}}

	"------------------+
	" YAML           {{{
	"------------------+
	au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	" }}}

	"------------------+
	" Slim           {{{
	"------------------+
	" Enable slim syntax highlight
	autocmd BufNewFile,BufRead *.slim set filetype=slim
	autocmd FileType slim setlocal foldmethod=indent
	" }}}

	"------------------+
	" Python         {{{
	"------------------+
	au FileType python setlocal nocindent
	au BufNewFile,BufRead *.py setlocal ts=4 sts=4 sw=4 expandtab autoindent textwidth=79
	" }}}

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
	au FileType sql setlocal ts=2 sts=2 sw=2 noexpandtab
	au BufNewFile,BufRead *.sql set ft=sql foldmethod=marker

augroup END "}}}
"}}}
