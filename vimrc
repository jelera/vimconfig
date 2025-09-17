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
  " let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#displayed_head_limit = 10
  let g:airline#extensions#branch#format = 1
	let g:airline_theme = 'luna'
	let g:ale_disable_lsp = 1
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

"Plug 'Valloric/ListToggle' "{{{
"	" Toggles the display of the QuickFix and the Location list
"	" Mappings:
"	" <leader>l for toggling the Location List
"	" <leader>q for toggling the QuickFix
""}}}
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

Plug 'github/copilot.vim' "{{{
	" Copilot
"}}}


Plug 'DanBradbury/copilot-chat.vim'


Plug 'hashivim/vim-terraform' "{{{
  " terraform
"}}}


"------------------+
" Autocompletion {{{
"------------------+
Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
	" Full LSP support and autocomplete for Vim
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes

	" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}
"}}}

"------------------+
" Linting {{{
"------------------+
Plug 'dense-analysis/ale' "{{{
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
				\ 'css': ['prettier'],
				\ 'ruby': ['standardrb'],
				\ 'eruby': ['erblint']
	\}
				" \ 'typescript': ['ng lint --fix', 'prettier', 'eslint'],

	let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

	let g:ale_linters = {
				\ 'javascript': ['eslint'],
				\ 'jsx' : ['eslint'],
				\ 'scss': ['stylelint'],
				\ 'ruby': ['standardrb']
	\}
				" \ 'typescript': ['ng lint', 'tsserver', 'eslint'],
	" let g:ale_ruby_rubocop_executable = 'bundle'
  " let g:ale_ruby_standardrb_executable = 'bundle'
  " 
  let g:ale_ruby_standardrb_executable = "bundle"
  let g:ale_ruby_standardrb_options = "--fix"
	let g:ale_lint_on_save = 1
	let g:ale_fix_on_save = 1

"}}}
"}}}

"------------------+
" Git {{{
"------------------+
Plug 'tpope/vim-fugitive' "{{{
	" Provides a nice interface and extra commands for Git
	augroup Fugitive
		autocmd!
		autocmd FileType fugitive setl nonumber
		autocmd FileType gitcommit setl nonumber
		autocmd FileType gitcommit setl spell
		autocmd FileType gitcommit setl formatoptions+=tn formatoptions-=l
		autocmd FileType gitcommit setl colorcolumn=72 textwidth=72

		if executable('par')
			autocmd FileType gitcommit setl formatprg=par\ -w72
		endif
	augroup END
"}}}

Plug 'tpope/vim-rhubarb' "{{{
	" Adds :Gbrowse for opening in Github
"}}}

Plug 'rhysd/committia.vim' "{{{
	" Provides a more pleasant editing on Git commit messages
"}}}

Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'knsh14/vim-github-link'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rhysd/github-complete.vim'
    augroup config-github-complete
        autocmd!
        autocmd FileType gitcommit setl omnifunc=github_complete#complete
    augroup END
"}}}

"------------------+
" Text helpers   {{{
"------------------+
Plug 'vim-scripts/matchit.zip' "{{{
	" Extends the existing functionality of the % command, matching also
	" parentheses, square and curly brackets, as well as conditional statements.
"}}}

Plug 'tpope/vim-commentary' "{{{
	" Adds a new command 'gc' for commenting out lines of text
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
	let g:closetag_filetypes = 'html,xhtml,erb,jsx,html.erb,eruby'
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
	let test#ruby#rspec#executable = 'bundle exec rspec'
	let test##rspec#executable = 'bundle exec rspec'
	" let test#ruby#rspec#executable = 'bundle exec rspec --format documentation'
	nnoremap <silent> <leader>tf :TestFile<CR>
	nnoremap <silent> <leader>tl :TestLast<CR>
	nnoremap <silent> <leader>tn :w<CR>:TestNearest<CR>
	nnoremap <silent> <leader>ts :TestSuite<CR>
"}}}

Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }

Plug 'tpope/vim-eunuch'
"}}}

"------------------+
" Colorschemes   {{{
"------------------+
Plug 'lifepillar/vim-gruvbox8'
"}}}

"------------------+
" Navigation     {{{
"------------------+
Plug 'liuchengxu/vista.vim' "{{{
	" Tag and LSP symbols viewer
"}}}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "{{{
	" Interactive fuzzy finder
	Plug 'junegunn/fzf.vim'
	" nnoremap <silent> <C-P> :GFiles<Enter>
	" nnoremap <silent> <C-B>b :Buffers<Enter>
	" nnoremap <silent> <C-B>h :History<Enter>
	" nnoremap <silent> <Leader>ag :Rg <C-R><C-W><CR>
	" " Ripgrep support with FZF
	" nnoremap <silent> \ :Rg<CR>
  " Fuzzy finder
nnoremap <C-p>g :Files<CR>
" or for fzf.vim: nnoremap <C-p>g :GFiles<CR>

" Search history
nnoremap <C-p>h :History<CR>

" Project finder (fuzzy finder in project)
nnoremap <C-p>p :GFiles<CR>
" or for telescope: nnoremap <C-p>p :Telescope find_files<CR>

" Buffer list (opened buffers/tabs)
nnoremap <C-p>b :Buffers<CR>
" or built-in: nnoremap <C-p>b :ls<CR>:b<Space>

" Commit search
nnoremap <C-p>c :Commits<CR>
" or for fugitive: nnoremap <C-p>c :GLog<CR>

" Command palette
nnoremap <C-p>a :Commands<CR>
" or built-in: nnoremap <C-p>a :<C-f>

	" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
	" let g:fzf_layout = { 'down' : '~40%' }

	" CTRL-A CTRL-Q to select all and build quickfix list

	function! s:build_quickfix_list(lines)
		call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
		copen
		cc
	endfunction

	let g:fzf_action = {
				\ 'ctrl-q': function('s:build_quickfix_list'),
				\ 'ctrl-t': 'tab split',
				\ 'ctrl-x': 'split',
				\ 'ctrl-v': 'vsplit' }

	let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
	"
"}}}

Plug 'preservim/nerdtree' "{{{
	" Tree file system explorer for Vim

	augroup NerdTree
		" autocmd BufWinEnter * NERDTreeFind
		autocmd StdinReadPre * let s:std_in=1
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	augroup END

	nnoremap <c-t> :NERDTreeToggle<Enter>
	nnoremap <silent> <C-B>t :NERDTreeFind<Enter>
	let NERDTreeQuitOnOpen = 1
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
"}}}

"------------------+
" Filetype       {{{
"------------------+
	" JavaScript, JSON, ES6, JSX -------------{{{
	Plug 'git@github.com:jelera/vim-javascript-syntax.git', { 'for': 'javascript' }
	Plug 'leafgarland/typescript-vim' " TypeScript syntax
	Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
	Plug 'jparise/vim-graphql'        " GraphQL syntax
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
		" let g:ruby_fold_lines_limit = 200
	"}}}
	Plug 'tpope/vim-rake'
	" Plug 'tpope/vim-bundler'
	Plug 'tpope/vim-rails'
	Plug 'tpope/vim-endwise' "{{{
		" Wisely add 'end' or (equivalent) in Ruby, Shell Scripting, Elixir, Lua,
		" Haskell, etc.

		" disable mapping to not break coc.nvim
		let g:endwise_no_mappings = 1
		"}}}
	"}}}

	" Markdown ---------------{{{
	Plug 'tpope/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } "{{{
	"	let g:mkdp_auto_start = 1
		let g:mkdp_theme = 'light'
	""}}}

	"}}}

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
"}}}

"----------------------------------------------------------------------------//
" FOLDING                                                                   {{{
"----------------------------------------------------------------------------//
set foldenable
set foldmethod=marker
" set foldlevel=99
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
set termguicolors

" let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox8_hard

set background=dark

if has('gui_running')
	" GVIM / MacVim"{{{
	set guioptions-=T
	set guioptions+=c
	" Font Selection
	if has('mac')
		" For MacVim
		set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h15
	else
		" For Linux gVim
		set guifont=Fira\ Code\ 12
	endif
	"}}}
else
	" Terminal Vim"{{{
	set t_Co=256
	"}}}
endif

hi  Comment  cterm=italic
hi  gitcommitFirstLine ctermfg=81
hi  gitcommitSummary ctermfg=81
hi  RubyKeywordAsMethod ctermfg=44
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

" Shows matching brackets when text indicator is over them
set showmatch

" Show 5 lines of context around the cursor
set scrolloff=5
set sidescrolloff=20

" The screen won't be redrawn unless actions took place
set lazyredraw

" Improves smoothness of redrawing when there are multiple windows and the
" terminal does not support a scrolling region
set ttyfast

" When moving thru the lines, the cursor will try to stay in the previous columns
set nostartofline

set cursorline
set showcmd
set pumheight=15
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
set textwidth=79

if executable('par')
	set formatprg=par\ -w79
endif
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
set expandtab
set smarttab
"}}}

"}}}

"----------------------------------------------------------------------------//
" TERMINAL                                                                  {{{
"----------------------------------------------------------------------------//
" nnoremap <c-t>h :vertical terminal<CR>
" nnoremap <c-t>j :below terminal<CR>
" nnoremap <c-t>k :above terminal<CR>
" nnoremap <c-t>l :rightb vertical terminal<CR>
" tnoremap <c-y> <C-\><C-n>
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
" " Use CTRL-Q to do what CTRL-V used to do, Blockwise Visual Selection
" noremap <C-Q> <C-V>

" CTRL-X is cut
vnoremap <C-X> "+x

" CTRL-C is copy
vnoremap <C-C> "+y

" Smart Paste CTRL-V from the system's clipboard and indents code automatically
nnoremap <leader>v "+P=']
" inoremap <C-V> <C-o>"+P<C-o>=']
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
	au FileType mail,text au BufEnter,BufWinEnter <buffer> setlocal spell
augroup END
"}}}

command Q q


"}}}

"----------------------------------------------------------------------------//
" ABBREVIATIONS                                                             {{{
"------------------------------------+---------------------------------------//
" Date Abbreviations              "{{{
"------------------------------------+
" adate : Dec 06, 2013
" pxdate : Fri, 06 Dec 2013 21:52:35 PM CDT
" rdate : Fri, 06 Dec 2013 21:52:35 -0600
" ldate : 2013-12-06 21:52:52
" sdate : 2013-12-06

" RFC822 date format"
" iab <expr> rdate strftime("%a, %d %b %Y %H:%M:%S %z")
iab <expr> pxdate strftime("%a %d %b %Y %I:%M:%S %p %Z")

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
	autocmd FileType javascript,php,c,cpp,css,scss      map <leader>hr 0i/**-------------------------------------------------------------------------**/<ESC>
	autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>hr 0i##---------------------------------------------------------------------------//<ESC>
	" Comment Banners (adds 5 spaces at each end)
	autocmd FileType vim                           map <leader>cb I"     <ESC>A     "<ESC>yyp0lv$hhr-yykPjj
	autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>cb I#     <ESC>A     #<ESC>yyp0lv$hhr-yykPjj
	autocmd FileType javascript,php,c,cpp,css,scss      map <leader>cb I/*     <ESC>A     */<ESC>yyp0llv$r-$hc$*/<ESC>yykPjj


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
		vertical resize 83
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
	" Format plain text and e-mails correctly
	autocmd BufNewFile,BufRead *.txt setl ft=text
augroup END "}}}

"------------------------------------+
augroup Whitespace                "{{{
"------------------------------------+
	autocmd!
	" Remove trailing whitespace from selected filetypes
	"au FileType html,css,sass,javascript,php,python,ruby,sql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()

	"function! <SID>StripTrailingWhitespace() "{{{
	"	" Preparation: save the last search, and curson position"
	"	let _s=@/
	"	let l = line('.')
	"	let c = col('.')
	"	" Do the business"
	"	" vint: -ProhibitCommandWithUnintendedSideEffect
	"	" vint: -ProhibitCommandRelyOnUser
	"	substitute('\s\+$', '', 'e')

	"	"Clean up: restore previous search history and cursor position"
	"	let @/=_s
	"	call cursor(l, c)
	"endfunction "}}}
augroup END "}}}

"------------------------------------+
augroup Filetype Specific         "{{{
"------------------------------------+
	autocmd!
	"------------------+
	" Markdown       {{{
	"------------------+
	autocmd FileType markdown setlocal spell
	autocmd FileType markdown setlocal autoindent
	" autocmd FileType markdown setlocal textwidth=80
	" autocmd FileType markdown setlocal formatoptions=tcroqn2 comments=n:>
	autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" }}}

	"----------------------+
	" HTML/XHTML/XML     {{{
	"----------------------+
	autocmd FileType html,xhtml,xml setlocal textwidth=0
	autocmd FileType html,xhtml,xml setlocal tabstop=3 shiftwidth=3 expandtab
	" }}}

	"------------------+
	" JavaScript     {{{
	"------------------+
	autocmd FileType javascript,javascript.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType json,jsonc setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  " Disable quote concealing in JSON files
  let g:vim_json_conceal=0
  " }}}

	"------------------+
	" TypeScript     {{{
	"------------------+
	autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" }}}

	"------------------+
	" CSS/SCSS            {{{
	"------------------+
	autocmd FileType css,scss setlocal smartindent
	autocmd FileType css,scss setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd FileType css setlocal equalprg=prettier\ --parser\ css\ --stdin\ --tab-width\ 2
	autocmd FileType css,scss noremap <leader>css %s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/
	autocmd FileType scss setl iskeyword+=@-@
	" }}}

	"------------------+
	" Ruby           {{{
	"------------------+
	autocmd FileType ruby,eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType ruby setlocal foldmethod=expr foldlevel=99
	autocmd FileType ruby,eruby setlocal foldmethod=expr foldlevel=99

	nnoremap <silent> <leader>l :!bundle\ exec\ standardrb\ --fix\ %<Enter>
	" }}}

	"------------------+
	" YAML           {{{
	"------------------+
	autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" }}}

	"------------------+
	" Slim           {{{
	"------------------+
	" Enable slim syntax highlight
	autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
	autocmd FileType slim setlocal foldmethod=indent
	" }}}
	"

	"------------------+
	" erb           {{{
	"------------------+
	autocmd FileType eruby setlocal foldmethod=indent
	" }}}
	"

	"------------------+
	" Python         {{{
	"------------------+
	au FileType python setlocal nocindent
	au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	au BufNewFile,BufRead *.py setlocal autoindent
	au BufNewFile,BufRead *.py setlocal textwidth=79
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
	" au FileType sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	au BufNewFile,BufRead *.sql set ft=sql foldmethod=marker
	au FileType sql setl cms=--%s

augroup END "}}}
"}}}
