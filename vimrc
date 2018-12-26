""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2018
""""""""""""""""""""""""""""""

"{{{ 0. Plugins
call plug#begin()
Plug 'Nequo/vim-allomancer'
Plug 'hashivim/vim-vagrant', { 'for': 'ruby' }
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'tpope/vim-repeat'
" Plug 'omnisharp/omnisharp-vim', { 'for': 'cs' }
Plug 'gu-fan/riv.vim'
Plug 'skywind3000/vim-preview'
Plug 'craigemery/vim-autotag'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive' " Git functionality
" Plug 'sodapopcan/vim-twiggy' " extension to fugitive
Plug 'tpope/vim-vinegar' " file browsing
Plug 'tpope/vim-rhubarb' " Git functionality
Plug 'tpope/vim-commentary' 
Plug 'airblade/vim-gitgutter' 
Plug 'plytophogy/vim-virtualenv', { 'for': 'python' }
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'pearofducks/ansible-vim', { 'for': ['yaml', 'yml'] }
Plug 'unblevable/quick-scope'	" highlight the next instance of chars for f,F,t,T movement
Plug 'ervandew/supertab'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'rizzatti/dash.vim', { 'on': ['Dash'] }
Plug 'aserebryakov/vim-todo-lists', { 'for': 'todo' }
Plug 'mbbill/undotree'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/vim-lsp', { 'for': ['python', 'cs', 'dockerfile', 'cpp'] }
Plug 'prabirshrestha/asyncomplete.vim', { 'for': ['python', 'cs', 'dockerfile', 'cpp'] }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': ['python', 'cs', 'dockerfile', 'cpp'] }
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim', { 'for': ['python', 'cs', 'cpp'] }
Plug 'w0rp/ale', { 'for': ['python', 'cs', 'dockerfile', 'terraform', 'json', 'yaml', 'yml', 'Makefile', 'lua', 'sql', 'pgsql', 'cpp', 'xml', 'rst', 'html', 'asciidoc', 'adoc', 'bash', 'sh', 'awk', 'ruby', 'rb'] }
call plug#end()
syntax on
filetype plugin indent on


"}}}

""" Runtime 
runtime! maps/**/*.vim
runtime! theme/**/*.vim

"{{{  3. Vim Settings
" set clipboard^=unnamed " yank/dd/x to system clipboard in addition to vim register
set ttimeoutlen=2
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set noswapfile
set nocompatible
set mouse=a          " enable mouse

""""" Set preview window height
set previewheight=50

" ctags optimizations
set autochdir
set tags=tags;/

""" Omnicompletion
set completeopt-=i " do not scan included files
set completeopt+=preview
"set omnifunc=syntaxcomplete#Complete



""" Tabs
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4 
set smarttab

""" Display options
set cursorline
set cursorcolumn
set showmatch        " show matching parens, brackets, etc 
set ruler              " display current line in status bar
set number            " real line number shown on current line
set noshowmode
set laststatus=2         " airline status bar always-on
set showcmd     " show incomplete commands as they are typed in status area

""" Search
set hlsearch  " highlight search terms
set incsearch   " jump to words as you search

""" Behavior
set backspace=indent,eol,start " make backspace behave 'normally'
set lazyredraw         " buffer screen instead of constant update
set virtualedit=block

""" Buffers and Windows
set splitbelow       " always open splits below current pane
set splitright       " always open splits to the right of current pane
" set winminwidth=0      " minimum width of pane


""" Text Organization
set foldmethod=marker
set breakindent
set showbreak=\\\

"}}}

" {{{  Completion
set path+=**    " search down into subfolders and provide tab completion
set wildmenu      " display all matching files when using tab complete
set wildmode=longest,list,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase
set smartcase      " ignore case unless specifically began with a capital
" }}}

" {{{  netrw
" hide banner
let g:netrw_banner = 0
" hide swp, DS_Store files
let g:netrw_list_hide='.*\.swp$,\.DS_Store'
" set tree style listing
"let g:netrw_liststyle=3
let g:netrw_liststyle=3
" display directories first
let g:netrw_sort_sequence='[\/]$'
" ignore case on sorting
let g:netrw_sort_options='i'
" vspilt netrw to the left window 
let g:netrw_altv = 1
" 30% of the screen for the netrw window, 70% for the file window
let g:netrw_winsize = 20
" open file in a previous buffer (right window)
let g:netrw_browse_split = 4
" buffer setting
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap number'
" }}}

" {{{  Colors

" let python_highlight_all=1
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
colorscheme onedark
set termguicolors
set background=dark

" airline settings
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='' " disable the arrows
let g:airline_right_sep=''

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

augroup langs
	au!
	autocmd FileType python runtime! languages/python.vim
	autocmd FileType yaml runtime! languages/yaml.vim
	autocmd FileType json runtime! languages/json.vim
	autocmd FileType cs runtime! languages/csharp.vim
	autocmd FileType dockerfile runtime! languages/dockerfile.vim
	autocmd FileType cpp runtime! languages/cpp.vim
augroup END


"
