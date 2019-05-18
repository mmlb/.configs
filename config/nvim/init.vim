if has('nvim')
	set tags+=./tags;,tags " Search up the dir tree for tags
	runtime! python_setup.vim
	"set t_Co=256
	tnoremap kk <C-\><C-n>
	autocmd TermClose * bd!
	autocmd TermOpen * setlocal nonumber norelativenumber

	" wal-ified vim-janah screenshot
	let g:terminal_color_0 = "#242324"
	let g:terminal_color_1 = "#778765"
	let g:terminal_color_2 = "#9B8A66"
	let g:terminal_color_3 = "#6A7987"
	let g:terminal_color_4 = "#75838F"
	let g:terminal_color_5 = "#8E8E8F"
	let g:terminal_color_6 = "#A5A4A5"
	let g:terminal_color_7 = "#D0D0CF"
	let g:terminal_color_8 = "#7b7b7b"
	let g:terminal_color_9 = "#778765"
	let g:terminal_color_10 = "#9B8A66"
	let g:terminal_color_11 = "#6A7987"
	let g:terminal_color_12 = "#75838F"
	let g:terminal_color_13 = "#8E8E8F"
	let g:terminal_color_14 = "#A5A4A5"
	let g:terminal_color_15 = "#D0D0CF"

	set inccommand=split
	set scrollback=50000
else
	" neovim default features
	syntax on
	set backspace=eol,start,indent " allow backspacing over indent, eol, and start
	set history=10000 " More command history
	set hlsearch "highlight search terms, temp clear with :noh
	set laststatus=2 "keep filename and ruler visible by having 2 lines for status
	set smarttab " make <tab> and <backspace> smarter
	set tags+=./tags;,tags " Search up the dir tree for tags
	set wildmenu "make tab completion for files/buffers act like bash
endif

" global settings:
let mapleader = ','
let g:mapleader = ','
nnoremap ; :
inoremap kk <Esc>

" Move between windows easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>ji <C-I>
nnoremap <leader>jo <C-O>
nnoremap <leader>t <C-t>
nnoremap <silent> ,/ :nohlsearch<CR>

set autoindent
set autowrite
set backup
set backupdir=~/.local/share/nvim/backup
" :N place case labels N characters indented from switch
" gN place C++ scope declarations N characters from block
set cino=:0,g0,l1,t0,(0,u0,N-s
set colorcolumn=+1 "highlight column after 'textwidth'
set complete+=k,kspell
"set completeopt=menu,menuone,longest,preview " disable preview scratch window
"set completeopt=longest,menu,menuone,noinsert,noselect,preview " disable preview scratch window
"set completeopt=menuone,noinsert,noselect " disable preview scratch window
set completeopt=noinsert,menuone,noselect
set dictionary+=$XDG_CONFIG_HOME/nvim/spell/en.utf-8.spl
"set diffopt+=algorithm:patience,indent-heuristic
set encoding=utf-8
set errorformat+=%f:%l
set foldmethod=syntax
"set foldlevel=0
set foldlevelstart=20
set foldnestmax=1
set hidden
set modeline
set mouse=a
set noshowmode
set nowrap
set number
set relativenumber
set pumheight=15
set shortmess+=c " suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set smartindent
"set spell
set splitright
set termguicolors
set textwidth=80
set title
set undofile
set undolevels=256
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.d,*.bin
set wildmode=list:longest,full

" plugin pre-config:
set completeopt+=noinsert
set completeopt+=noselect

call plug#begin($XDG_CONFIG_HOME . "/nvim/plugged")

" section: linters and status line:
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline'

let g:autoformat_autoindent = 0 " if no known formatter then don't mess with the indentation
"let g:autoformat_verbosemode=1
let g:formatdef_black = '"black --py36 -S"'
"let g:formatdef_shfmt = '"shfmt -s"'
let g:formatdef_terraformfmt = '"terraform fmt -"'
let g:formatters_c = []
let g:formatters_go = []
let g:formatters_h = []
let g:formatters_python = ['black']
"let g:formatters_sh = ['shfmt']
let g:formatters_terraform = ['terraformfmt']
Plug 'Chiel92/vim-autoformat'
"let g:airline#extensions#ale#enabled = 1
"let g:ale_go_gometalinter_options = '--fast --errors'
"let g:ale_linters = {'go': ['gometalinter', 'gofmt', 'go build']}
"Plug 'w0rp/ale'

" section: color schemes:
Plug 'mhinz/vim-janah'

" section: file type plugins (syntax, lint, format):
let g:LanguageClient_serverCommands = {
	\ 'go': ['go-langserver', '-gocodecompletion'],
	\ 'python': ['pyls'],
\ }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'chr4/nginx.vim', {'for': 'nginx'}

let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
Plug 'davidhalter/jedi-vim', {'for': ['python']}
let g:vim_json_syntax_conceal = 0
Plug 'elzr/vim-json'

au FileType go nmap <leader>b <plug>(go-build)
au FileType go nmap <leader>c <plug>(go-callers)
au FileType go nmap <leader>r <plug>(go-referrers)
au FileType go nmap <leader>t <plug>(go-test)
au FileType go nmap <leader>i <plug>(go-info)
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_highlight_build_constraints = 1
Plug 'fatih/vim-go', {'for': ['go', 'gotexttmpl']}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'LnL7/vim-nix'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
Plug 'pangloss/vim-javascript', {'for': 'js'}
Plug 'pearofducks/ansible-vim'
Plug 'roxma/nvim-yarp'
Plug 'saltstack/salt-vim'

let g:xml_syntax_folding = 1
Plug 'sukima/xmledit', {'for': 'xml'}
Plug 'wgwoods/vim-systemd-syntax'
"Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp']}
"Plug 'zchee/deoplete-go', {'for': ['go'], 'do': 'make'}
"Plug 'zchee/deoplete-jedi', {'for': ['python']}

" section misc:
Plug 'editorconfig/editorconfig-vim'

let g:SuperTabDefaultCompletionType = '<c-n>'
Plug 'ervandew/supertab'

let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"Plug 'nathanaelkane/vim-indent-guides'

let g:nvimux_open_term_by_default = 1
Plug 'kassio/neoterm' "nvimux depends on neoterm being loaded first
Plug 'kshenoy/vim-signature'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
nmap <C-P> :FZF<CR>
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak' "TODO: learn better
Plug 'Konfekt/FastFold' "TODO:outgoing
Plug 'kopischke/vim-fetch'
Plug 'mhinz/vim-startify' "TODO: learn better
Plug 'qpkorr/vim-bufkill' "TODO:outgoint
Plug 'rhysd/clever-f.vim'
Plug 'salsifis/vim-transpose'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating' "TODO: learn better
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment' "TODO: learn better
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
Plug 'Valloric/ListToggle' "TODO: learn better
Plug 'wellle/targets.vim' "TODO: learn better

call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()

function LC_maps()
	if has_key(g:LanguageClient_serverCommands, &filetype)
		nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
		nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
		nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
	endif
endfunction
autocmd FileType * call LC_maps()

" plugin post-config:
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" colorscheme:
colorscheme janah

" other miscs:
autocmd BufWritePre * :Autoformat
autocmd FileType diff let g:autoformat_retab = 0 | let g:autoformat_remove_trailing_spaces = 0
autocmd FileType gitcommit let b:airline_whitespace_disabled=1
autocmd FileType go :set textwidth=120
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd Syntax gitcommit normal zR

"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#align_class = 1
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
