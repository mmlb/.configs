syntax on

if has('nvim')
	runtime! plugin/python_setup.vim
endif

let g:powerline_loaded = 1

set nocompatible " Do not be vi compatible (be more useful)
set encoding=utf-8
let mapleader = ','
set shell=bash

nnoremap ; :

let sh_minlines = 300 "Fixes the highlight errors when scrolling backwards
let g:sh_fold_enabled = 1 "Enable folding of sh functions
set autoindent
set backspace=eol,start,indent " allow backspacing over indent, eol, and start
set hidden " Hide buffers instead of closing them, when changing
set history=1000 " More command history
set hlsearch "highlight search terms, temp clear with :noh
nnoremap <silent> ,/ :nohlsearch<CR>
set fdm=syntax
set fdn=1
set laststatus=2 "keep filenam#e and ruler visible by having 2 lines for status
set mouse=a "enable use of mouse from vim/terminal
set nobackup
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)e
set nowrap " Do not wrap line
set number " Line numbers
set pumheight=15 " Limit popup menu height
set smartindent
set smarttab " make <tab> and <backspace> smarter
set textwidth=100 " Break long lines @ 80 chars
set colorcolumn=+1 "highlight column after 'textwidth'
set title
set undofile
set undolevels=256 " More undo
"set wildmenu " make tab completion for files/buffers act like bash
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.d,*.bin " Dont tab complete some files

set complete+=k "enable dictionary completion
" Disable preview scratch window
set completeopt=menu,menuone,longest,preview

set guioptions-=m " Remove gvim menu bar
set guioptions-=T " Remove gvim menu toolbar
set guioptions-=r " Remove gvim menu toolbar
set guicursor+=a:blinkon0 " Disable gvim cursor blink
" :N place case labels N characters indented from switch
" gN place C++ scope declarations N characters from block
set cino=:0,g0,l1,t0,(0,u0,N-s
set tags+=tags;/ " Search up the dir tree for tags


" Vundle stuff
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'cstrahan/vim-capnp'
let g:promptline_powerline_symbols = 0
Plugin 'edkolev/promptline.vim'
Plugin 'embear/vim-localvimrc'
let g:localvimrc_persistent = 1
set viminfo+=! "enable storing certain global variables

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
Plugin 'fatih/vim-go'

Plugin 'fholgado/minibufexpl.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'hickop/vim-hickop-colors'
Plugin 'jnurmine/Zenburn'

let g:ctrlp_extensions = ['tag', 'buffertag']
Plugin 'kien/ctrlp.vim'
nmap <leader>p :CtrlPMixed<CR>

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = winwidth(0) - &textwidth - 7
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_type_go = {'ctagstype' : 'go', 'kinds' : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'], 'sro' : '.', 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' }, 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' }, 'ctagsbin'  : 'gotags', 'ctagsargs' : '-sort -silent' }

Plugin 'mbbill/undotree'
let g:undotree_DiffCommand = 'diff -u'
nnoremap <F5> :UndotreeToggle<CR>

Plugin 'nanotech/jellybeans.vim'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/syntastic'
let g:syntastic_c_checker = 'clang'

Plugin 'sickill/vim-monokai'
Plugin 'sjl/badwolf'
Plugin 'sukima/xmledit'
let g:xml_syntax_folding = 1

Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'

let g:CommandTFileScanner = 'find'
Plugin 'wincent/Command-T'
Plugin 'Valloric/YouCompleteMe' ", managed with pacman so local llvm is used
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf_globlist = ['~/projects/*', '~/code/*', '~/src/*']
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jo <C-O>
nnoremap <leader>ji <C-I>

Plugin 'w0ng/vim-hybrid'

call vundle#end()

filetype plugin indent on

"set guifont=Droid\ Sans\ Mono\ Dotted\ 11
"set guifont=Meslo\ LG\ S\ DZ\ 11
"set guifont=Menlo\ for\ Powerline\ 11
"set guifont=Source\ Code\ Pro\ Semibold\ for\ Powerline\ Semi-Bold\ 11
set guifont=Source\ Code\ Pro\ Semibold\ Semi-Bold\ 11

""""""""""""""""""""""""""
" Easy window navigation "
""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""
" Color schemes "
"""""""""""""""""
set t_Co=256
set background=dark
let g:rehash256=1

"colorscheme badwolf
"colorscheme hickop
colorscheme hybrid
"colorscheme jellybeans
"let g:solarized_termcolors=256
"colorscheme solarized
"let g:zenburn_high_Contrast=1
"colorscheme zenburn
"let g:molokai_original = 1
"colorscheme molokai
"colorscheme monokai

let g:proj_window_width=12

" Add tab after word that is completed already:
"  - Be in insert mode
"  - Type Ctrl-V Tab

"ctags -R --sort=foldcase --c++-kinds=+p --c-kinds=+p --fields=+Sail --extra=+q
"cscope -bqRs -P

" search up the directory tree for cscope files, and add it
au BufReadPost *.[cChH],*.[cChH][pP][pP] silent! call AddCScopeFiles()
function AddCScopeFiles()
	for f in findfile("cscope.out", ".;/", -1)
		let $CSCOPE_DB = f
		try
			cs add $CSCOPE_DB
			"set cscoperelative " with no prefix given, use dirname of cscope.out
					   " makes it easy to use with autochdir
			set nocscopetag
		catch
		endtry
	endfor
	cs reset
endfunction
