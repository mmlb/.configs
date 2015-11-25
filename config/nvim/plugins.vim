call plug#begin('~/.vim/plugged')


Plug 'a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

Plug 'beautify-web/js-beautify', {'for': 'javascript'}
Plug 'bling/vim-bufferline'
Plug 'bruno-/vim-man'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'cstrahan/vim-capnp'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'dericofilho/vim-phpfmt', {'for': 'php'}

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "goimports"
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'fatih/vim-nginx', {'for': 'nginx'}

Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/vim-plug'
"let g:zenburn_high_Contrast = 1
Plug 'jnurmine/Zenburn'

let g:ctrlp_extensions = ['tag', 'buffertag']
Plug 'kien/ctrlp.vim'
nmap <leader>p :CtrlPMixed<CR>

Plug 'kopischke/vim-fetch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = winwidth(0) - &textwidth - 7
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_type_go = {'ctagstype' : 'go', 'kinds' : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'], 'sro' : '.', 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype'}, 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' }, 'ctagsbin'  : 'gotags', 'ctagsargs' : '-sort -silent' }

Plug 'markcornick/vim-terraform'
Plug 'mdlerch/vim-tungsten'
Plug 'mmlb/vim-systemd'
Plug 'myusuf3/numbers.vim'
Plug 'romainl/Apprentice'
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {"BasedOnStyle": "LLVM", "IndentWidth": 8, "UseTab": "Always", "BreakBeforeBraces": "Linux", "AllowShortIfStatementsOnASingleLine": "false", "IndentCaseLabels": "false"}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'salsifis/vim-transpose'
Plug 'saltstack/salt-vim', {'for': 'sls'}
Plug 'scrooloose/syntastic'

Plug 'sukima/xmledit', {'for': 'xml'}
let g:xml_syntax_folding = 1

Plug 'tomasr/molokai'
"Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'techlivezheng/vim-plugin-minibufexpl'
Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'go', 'python', 'c#'], 'do': 'cd ~/.vim/plugged/YouCompleteMe && ./install.sh --system-boost --clang-completer --system-libclang --gocode-completer'}
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifier_from_tags_files = 1
let g:ycm_extra_conf_globlist = ['~/projects/*', '~/code/*', '~/src/*']
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jo <C-O>
nnoremap <leader>ji <C-I>

Plug 'vim-scripts/SQLUtilities', {'for': ['sql', 'php']}
Plug 'vim-scripts/Align'
Plug 'vim-scripts/visual-increment'

Plug 'wellle/targets.vim'

call plug#end()
