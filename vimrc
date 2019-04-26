""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2018
""""""""""""""""""""""""""""""

"{{{ 0. Plugins
call plug#begin()
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'Nequo/vim-allomancer'
Plug 'omnisharp/omnisharp-vim', {'for': 'cs' }
Plug 'hashivim/vim-vagrant', { 'for': 'ruby' }
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'tpope/vim-repeat'
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
Plug 'w0rp/ale'
"Plug 'w0rp/ale', { 'for': ['python', 'cs', 'dockerfile', 'terraform', 'json', 'yaml', 'yml', 'Makefile', 'lua', 'sql', 'pgsql', 'cpp', 'xml', 'rst', 'html', 'asciidoc', 'adoc', 'bash', 'sh', 'awk', 'ruby', 'rb', 'vim'] }
call plug#end()
syntax on
filetype plugin indent on


"}}}

""" Runtime
runtime! maps/**/*.vim
runtime! theme/**/*.vim

"{{{  Vim Settings
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

" {{{ Plugin Settings

""""" Terraform 
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

""" vim-autotag
let g:autotagTagsFile="tags"
let g:autotagCtagsCmd="ctags -R --append --exclude=.git --exclude=.venv --fields=+nS ."

""" vim-repeat
" Allows . to repeat non-native mappings
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

""" Tagbar
let g:tagbar_width = 42
let g:tagbar_autofocus = 0

""" Twiggy
" let g:twiggy_group_locals_by_slash = 0
" let g:twiggy_local_branch_sort = 'mru'
" let g:twiggy_remote_branch_sort = 'date'

""" VirtualEnv
let g:virtualenv_auto_activate = 1

" {{{ ale
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_python_auto_pipenv = 1
let b:ale_fixers = ['autopep8']
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" if value is 1, open list of errors in location window on save
let g:ale_open_list = 0
let g:ale_linters = {
			\ 'cs': ['OmniSharp'],
			\ 'css': ['prettier'],
			\ 'python': ['pylint', 'flake8'],
			\ 'dockerfile': ['hadolint'],
			\ 'terraform': ['tflint'],
			\ 'json': ['jsonlint'],
			\ 'yaml': ['yamllint', 'ansible-lint'],
			\ 'Makefile': ['checkmake'],
			\ 'lua': ['luac'],
			\ 'sql': ['sqlint'],
			\ 'pgsql': ['sqlint'],
			\ 'cpp': ['clangd'],
			\ 'vim': ['vint'],
			\ 'xml': ['xmllint'],
			\ 'rst': ['alex'],
			\ 'html': ['tidy', 'alex'],
			\ 'asciidoc': ['alex'],
			\ 'adoc': ['alex'],
			\ 'sh': ['shellcheck'],
			\ 'ruby': ['brakeman']
			\}
" }}}


""" asyncomplete 
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
" close preview window automatically after completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

""" asyncrun
let g:asyncrun_open = 15

""" ansible-vim
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = "b" 
let g:ansible_with_keywords_highlight = 'Constant'
let g:ansible_normal_keywords_highlight = 'Constant'

""" FZF
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1    " jump to existing window if possible
let g:fzf_layout = { 'down': '~25%' }
" }}}

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
colorscheme gruvbox
set termguicolors
set background=dark

" airline settings
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='' " disable the arrows
let g:airline_right_sep=''
" }}}

" {{{ Customize fzf colors to match your color scheme
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

" {{{ Languages
augroup langs
	au!
	autocmd FileType html runtime! languages/html.vim
	autocmd FileType css runtime! languages/css.vim
	autocmd FileType python runtime! languages/python.vim
	autocmd FileType yaml runtime! languages/yaml.vim
	autocmd FileType json runtime! languages/json.vim
	autocmd FileType cs runtime! languages/csharp.vim
	autocmd FileType dockerfile runtime! languages/dockerfile.vim
	autocmd FileType cpp runtime! languages/cpp.vim
augroup END
" }}}

" Changes the window-local current directory to be the same as current file
autocmd BufEnter * silent! lcd %:p:h


"
