syntax on

" Switch between views Tab & Backspace
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W

set mouse=a

set backspace=indent,eol,start

" Remove preview on autocomplite
set completeopt-=preview
" Optimize scrolling
set ttyfast
" Open new windows in separate tab
tab sball

if has("clipboard")
  set clipboard=unnamed " Copy to the system clipboard
endif

" Default encoding
set enc=utf-8
" Always show the status bar
set ls=2
" Incremental search
set incsearch
" Highlight search result
set hlsearch
" show lines numbers
set nu

set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

set smarttab         " enchanced tab on new line 
set tabstop=4        " number of spaces in tab
set shiftwidth=4     " number of spaces in tab
set expandtab        " change tab to spaces

" highlite text over 80 symbols in Ruby/Python/js/C/C++
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

"=====================================================
" Plugin settings
"=====================================================
" SnipMate directory path with code snippets
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"

" TagBar view settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " turn off autofocus on Tagbar opening

" NerdTree view settings
map <F3> :NERDTreeToggle<CR>
" ignored extenstions
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Close current view
noremap <F7> :bd<CR>

" ConqueTerm settings
" Run interpreter on F10
nnoremap <F10> :ConqueTermSplit ipython3<CR>
" run debug-mode on <F5>
nnoremap <F5> :exe "ConqueTermSplit ipython3 " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" run check pyflakes and PEP8 on <leader>8 ('\' + '8')
" autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Filetype detection settings
set nocompatible
filetype off
filetype plugin on
filetype plugin indent on

"=====================================================
"" Vundle settings
"=====================================================
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'    " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'         " Project and file navigation
Plugin 'majutsushi/tagbar'           " Class/module browser

""------------------=== Other ===----------------------
Plugin 'bling/vim-airline'          " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fisadev/FixedTaskList.vim'    " Pending tasks list
Plugin 'rosenfeld/conque-term'        " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'   " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'   " dependencies #2
Plugin 'honza/vim-snippets'    " snippets repo

""---------------=== Python support ===-------------
" Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'klen/python-mode'          
Plugin 'davidhalter/jedi-vim'    " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'   " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'scrooloose/syntastic'

call vundle#end()                " required

"=====================================================
" Syntastic settings
"=====================================================
let g:syntastic_enable_signs=1
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_aggregate_errors = 1
autocmd FileType python map <buffer> <leader>8 :SyntasticCheck flake8 pylint<CR> :Errors<CR>

"=====================================================
" Python-mode settings
"=====================================================
" let g:pymode_python = 'python3'

" Turn off pymode autocomplete (we use jedi-vim for autocomplete)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Code checking by linters
" Use syntastic instead of pymode_lint
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" Run checks on save
let g:pymode_lint_write = 0

" Enable virtualenv support
let g:pymode_virtualenv = 1

" breakpoints settings
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" highlite syntax
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" turn off autofold on source code
let g:pymode_folding = 0

" Turn off code run
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

