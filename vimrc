" nvim: {{{
if has('nvim')
	runtime! python_setup.vim
	set t_Co=256
	tnoremap <Esc> <C-\><C-n>
	autocmd TermClose * bd!

	" dark0 + gray
	let g:terminal_color_0 = "#282828"
	let g:terminal_color_8 = "#928374"

	" neurtral_red + bright_red
	let g:terminal_color_1 = "#cc241d"
	let g:terminal_color_9 = "#fb4934"

	" neutral_green + bright_green
	let g:terminal_color_2 = "#98971a"
	let g:terminal_color_10 = "#b8bb26"

	" neutral_yellow + bright_yellow
	let g:terminal_color_3 = "#d79921"
	let g:terminal_color_11 = "#fabd2f"

	" neutral_blue + bright_blue
	let g:terminal_color_4 = "#458588"
	let g:terminal_color_12 = "#83a598"

	" neutral_purple + bright_purple
	let g:terminal_color_5 = "#b16286"
	let g:terminal_color_13 = "#d3869b"

	" neutral_aqua + faded_aqua
	let g:terminal_color_6 = "#689d6a"
	let g:terminal_color_14 = "#8ec07c"

	" light4 + light1
	let g:terminal_color_7 = "#a89984"
	let g:terminal_color_15 = "#ebdbb2"
else
	" neovim default features
	syntax on
	set mouse=a "enable use of mouse from vim/terminal
	set backspace=eol,start,indent " allow backspacing over indent, eol, and start
	set history=10000 " More command history
	set hlsearch "highlight search terms, temp clear with :noh
	set laststatus=2 "keep filename and ruler visible by having 2 lines for status
	set smarttab " make <tab> and <backspace> smarter
	set tags+=./tags;,tags " Search up the dir tree for tags
	set wildmenu "make tab completion for files/buffers act like bash
endif
"}}}
" global settings: {{{
let mapleader = ','
let g:mapleader = ','
nnoremap ; :

" Move between windows easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <silent> ,/ :nohlsearch<CR>

let g:terminal_scrollback_buffer_size = 100000

set autoindent
set backup
set backupdir=~/.local/share/nvim/backup
" :N place case labels N characters indented from switch
" gN place C++ scope declarations N characters from block
set cino=:0,g0,l1,t0,(0,u0,N-s
set colorcolumn=+1 "highlight column after 'textwidth'
set complete+=k "enable dictionary completion source
set complete+=kspell "enable spell-file completion source
set completeopt=menu,menuone,longest,preview " disable preview scratch window
set encoding=utf-8
set foldmethod=syntax
set foldlevel=0
set foldnestmax=1
"let &foldlevelstart=&foldnestmax + 1
set hidden " Hide buffers instead of closing them, when changing
set modeline
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nowrap " Do not wrap line
set number relativenumber " hybrid number mode
set pumheight=15 " Limit popup menu height
"set scrolloff=999 " keep cursor in middle of window when scrolling
set smartindent
set spell
set splitbelow
set termguicolors " truecolor support
set textwidth=80 " Break long lines @ 80 chars
set title
set undofile
set undolevels=256 " More undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.d,*.bin " Dont tab complete some files
set wildmode=list:longest,full
"}}}

" plugin pre-config: {{{
set completeopt+=noinsert
set completeopt+=noselect
"let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"}}}
call plug#begin('~/.vim/plugged')
" linters and status line: {{{

Plug 'neomake/neomake'
" apparently pattern can do invert-match but its arcane/not-well known
" http://vim.1045645.n5.nabble.com/autocmd-pattern-exclusion-td5712330.html
"autocmd BufWritePost * call GoNeomakeBang()
"function! GoNeomakeBang()
"	if &ft == 'go'
"		Neomake!
"	else
"		Neomake
"	endif
"endfun

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline_theme = 'dark'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

"let g:formatters_go = []
"let g:autoformat_verbosemode = 1
Plug 'Chiel92/vim-autoformat'

"Plug 'scrooloose/syntastic'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_cpp_checkers = ["clang_check", "clang_tidy"]
"let g:syntastic_cpp_clang_check_post_args = ""
"let g:syntastic_cpp_clang_tidy_post_args = ""
"let g:syntastic_cpp_compiler = "clang++"
"let g:syntastic_go_checkers = []

"Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'python', 'c#'], 'do': 'cd ~/.vim/plugged/YouCompleteMe && ./install.sh --system-boost --clang-completer --system-libclang --gocode-completer'}
"autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_collect_identifier_from_tags_files = 1
"let g:ycm_extra_conf_globlist = ['~/projects/*', '~/code/*', '~/src/*']
"let g:ycm_seed_identifiers_with_syntax = 1
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jo <C-O>
nnoremap <leader>ji <C-I>
"}}}
" color schemes: {{{
"Plug 'chriskempson/base16-vim'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'cschlueter/vim-mustang'
"let g:zenburn_high_Contrast = 1
"Plug 'jnurmine/Zenburn'
"Plug 'mdlerch/vim-tungsten'
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
"Plug 'romainl/Apprentice'
"Plug 'tomasr/molokai'
Plug 'fxn/vim-monochrome'
"}}}
" file type plugins (syntax, lint, format): {{{
Plug 'beautify-web/js-beautify', {'for': 'javascript'}
Plug 'bling/vim-bufferline'
Plug 'bruno-/vim-man'
Plug 'chase/vim-ansible-yaml'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'cstrahan/vim-capnp'
Plug 'elzr/vim-json'

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-callers)
au FileType go nmap <leader>i <Plug>(go-imports)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
"let g:go_fmt_experimental = 1
let g:go_highlight_build_constraints = 1
"autocmd BufWritePost *.go GoBuild
"let g:go_fmt_command = "goimports"
Plug 'fatih/vim-go', {'for': 'go'}

Plug 'fatih/vim-nginx', {'for': 'nginx'}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'hashivim/vim-vagrant'
Plug 'jelera/vim-javascript-syntax', {'for': 'js'}
Plug 'markcornick/vim-terraform'
Plug 'mmlb/vim-systemd'
Plug 'nhooyr/neoman.vim'
Plug 'phpfmt/vim-phpfmt', {'for': 'php'}
let g:phpfmt_update_on_open = 0

Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {"BasedOnStyle": "LLVM", "IndentWidth": 8, "UseTab": "Always", "BreakBeforeBraces": "Linux", "AllowShortIfStatementsOnASingleLine": "false", "IndentCaseLabels": "false"}

Plug 'sukima/xmledit', {'for': 'xml'}
let g:xml_syntax_folding = 1
"}}}
" misc: {{{

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<c-n>'

Plug 'guns/xterm-color-table.vim'
Plug 'hkupty/nvimux'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
nmap <C-P> :FZF<CR>
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm' "nvimux depends on neoterm being loaded first
Plug 'Konfekt/FastFold'

"Plug 'kopischke/vim-stay'
"set viewoptions=cursor,folds,slash,unix

Plug 'kopischke/vim-fetch'
"Plug 'ludovicchabant/vim-gutentags'

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = winwidth(0) - &textwidth - 7
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_type_go = {'ctagstype' : 'go', 'kinds' : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'], 'sro' : '.', 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype'}, 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' }, 'ctagsbin'  : 'gotags', 'ctagsargs' : '-sort -silent' }

Plug 'mbbill/undotree'

"Plug 'mhinz/vim-startify'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'rhysd/clever-f.vim'
"Plug 'rhysd/committia.vim'
Plug 'salsifis/vim-transpose'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vinarise.vim'
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'

"Plug 'techlivezheng/vim-plugin-minibufexpl'

Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities', {'for': ['sql', 'php']}
Plug 'vim-scripts/visual-increment'
Plug 'wellle/targets.vim'
Plug 'zchee/deoplete-go', {'for': ['go'], 'do': 'make'}
"}}}
call plug#end()
" plugin post-config: {{{
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"}}}

" gui: {{{
set guioptions-=mTr " Remove gvim menu bars
set guicursor+=a:blinkon0 " Disable gvim cursor blink

"set guifont=Source\ Code\ Pro\ Semibold\ Semi-Bold\ 14
set guifont=Hack\ 14
"}}}
" colorscheme: {{{
set background=dark
"autocmd ColorScheme janah highlight Normal ctermbg=235
"set background=dark
"colorscheme Tomorrow-Night
"colorscheme apprentice
"colorscheme base16-ocean
"colorscheme base16-tomorrow
"colorscheme janah
"colorscheme molokai
colorscheme monochrome
"colorscheme zenburn
if g:colors_name=="zenburn"
	hi! CursorLineNr guibg=#333333
	hi! LineNr guibg=#333333
	hi! Visual guibg=#333333
	hi! VisualNOS guibg=#333333
endif
"}}}
" other miscs: {{{
let g:proj_window_width=12

autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"autocmd BufWrite * :Autoformat
autocmd FileType diff let g:autoformat_autoindent = 0 | let g:autoformat_retab = 0 | let g:autoformat_remove_trailing_spaces = 0

" Add tab after word that is completed already:
"  - Be in insert mode
"  - Type Ctrl-V Tab

"ctags -R --sort=foldcase --c++-kinds=+p --c-kinds=+p --fields=+Sail --extra=+q
"cscope -bqRs -P
"}}}

"nnoremap gd gd | zo
