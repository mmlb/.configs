syntax on

if has('nvim')
	runtime! python_setup.vim
endif

set encoding=utf-8
let mapleader = ','
let g:mapleader = ','

set backupdir=~/.local/share/nvim/backup

nnoremap ; :

" Move between windows easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

if has ('nvim')
	tnoremap <Esc> <C-\><C-n>
endif

let sh_minlines = 300 "Fixes the highlight errors when scrolling backwards
let g:sh_fold_enabled = 1 "Enable folding of sh functions
set modeline
set autoindent
set backspace=eol,start,indent " allow backspacing over indent, eol, and start
set hidden " Hide buffers instead of closing them, when changing
set history=1000 " More command history
set hlsearch "highlight search terms, temp clear with :noh
nnoremap <silent> ,/ :nohlsearch<CR>
set fdm=syntax
set fdn=1
set laststatus=2 "keep filename and ruler visible by having 2 lines for status
if !has('nvim')
    set mouse=a "enable use of mouse from vim/terminal
endif
set backup
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)e
set nowrap " Do not wrap line
set number " Line numbers
set pumheight=15 " Limit popup menu height
set smartindent
set smarttab " make <tab> and <backspace> smarter
set textwidth=80 " Break long lines @ 80 chars
set colorcolumn=+1 "highlight column after 'textwidth'
set title
set undofile
set undolevels=256 " More undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.d,*.bin " Dont tab complete some files
set wildmenu "make tab completion for files/buffers act like bash
set wildmode=list:longest,full

set complete+=k "enable dictionary completion
" Disable preview scratch window
set completeopt=menu,menuone,longest,preview

set guioptions-=mTr " Remove gvim menu bars
set guicursor+=a:blinkon0 " Disable gvim cursor blink
" :N place case labels N characters indented from switch
" gN place C++ scope declarations N characters from block
set cino=:0,g0,l1,t0,(0,u0,N-s
set tags+=tags;/ " Search up the dir tree for tags

runtime plugins.vim

"set guifont=Source\ Code\ Pro\ Semibold\ Semi-Bold\ 14
set guifont=Hack\ 14

if !has('nvim')
	set t_Co=256
endif
"set background=dark
"colorscheme apprentice
"colorscheme base16-ocean
"colorscheme base16-tomorrow
"colorscheme molokai
"colorscheme Tomorrow-Night
colorscheme zenburn
if g:colors_name=="zenburn"
	hi! CursorLineNr guibg=#333333
	hi! LineNr guibg=#333333
        hi! Visual guibg=#333333
        hi! VisualNOS guibg=#333333
endif


let g:proj_window_width=12

autocmd BufRead,BufNewFile *.adoc setlocal filetype=asciidoc makeprg=asciidoctor\ %

" Add tab after word that is completed already:
"  - Be in insert mode
"  - Type Ctrl-V Tab

"ctags -R --sort=foldcase --c++-kinds=+p --c-kinds=+p --fields=+Sail --extra=+q
"cscope -bqRs -P
