set nocompatible " Do not be vi compatible (be more useful)
set encoding=utf-8

filetype off                   " required!
let mapleader = ','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'davidhalter/jedi-vim'
Bundle 'embear/vim-localvimrc'
let g:localvimrc_persistent = 1
set viminfo+=! "enable storing certain global variables
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'scrooloose/syntastic'
let g:syntastic_c_checker = 'clang'
Bundle 'sukima/xmledit'
let g:xml_syntax_folding = 1
Bundle 'tpope/vim-fugitive'
Bundle 'LustyJuggler'
let g:LustyJugglerDefaultMappings = 0
nmap <leader>jl :LustyJuggler<CR>
Bundle 'Raimondi/delimitMate'
"Bundle 'Valloric/YouCompleteMe', managed with pacman so local llvm is used
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf_globlist = ['~/code/*']
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jo <C-O>
nnoremap <leader>ji <C-I>

filetype on
filetype indent on
filetype plugin on

syntax on

nnoremap ; :

let sh_minlines = 300 "Fixes the highlight errors when scrolling backwards
let g:sh_fold_enabled = 1 "Enable folding of sh functions

"
" NOTE: most of these should probably be above vundle configs
"

"set autochdir
set autoindent
set backspace=eol,start,indent " allow backspacing over indent, eol, and start
set hidden " Hide buffers instead of closing them, when changing
set history=1000 " More command history
set hlsearch "highlight search terms, temp clear with :noh
nnoremap <silent> ,/ :nohlsearch<CR>
set fdm=syntax
set fdn=1
set laststatus=2 "keep filename and ruler visible by having 2 lines for status
set mouse=a "enable use of mouse from vim/terminal
set nobackup
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)e
set nowrap " Do not wrap line
set number " Line numbers
set pumheight=15 " Limit popup menu height
set smartindent
set smarttab " make <tab> and <backspace> smarter
set textwidth=80 " Break long lines @ 80 chars
set title
set undofile
set undolevels=256 " More undo
"set wildmenu " make tab completion for files/buffers act like bash
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.d,*.bin " Dont tab complete some files

set complete+=k "enable dictionary completion
" Disable preview scratch window
set completeopt=menu,menuone,longest,preview

set go-=m " Remove gvim menu bar
set go-=T " Remove gvim menu toolbar
set guicursor+=a:blinkon0 " Disable gvim cursor blink
"set guifont=Droid\ Sans\ Mono\ Dotted\ 11
"set guifont=Meslo\ LG\ S\ DZ\ 11
"set guifont=Menlo\ for\ Powerline\ 11
set guifont=Source\ Code\ Pro\ Semibold\ for\ Powerline\ Semi-Bold\ 11

" :N place case labels N characters indented from switch
" gN place C++ scope declarations N characters from block
set cino=:0,g0,l1,t0,(0,u0,N-s

set tags+=tags;/ " Search up the dir tree for tags


" Easy window navigation "
""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Color schemes "
"""""""""""""""""
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"let g:zenburn_high_Contrast=1
"colorscheme zenburn

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
