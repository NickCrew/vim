""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2019
""""""""""""""""""""""""""""""
"{{{ 0. Plugins

call plug#begin()
"""" Colorschemes and appearance plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'Nequo/vim-allomancer'
"""" Source Control
Plug 'mhinz/vim-signify'  " Show changes in gutter
" Plug 'tpope/vim-fugitive' " Git functionality
" Plug 'sodapopcan/vim-twiggy' " extension to fugitive
" Plug 'tpope/vim-rhubarb' " Git functionality
Plug 'mbbill/undotree'  " Tree-style undo and redo history
"""" File Search and Browse
Plug '/usr/local/opt/fzf'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar' " file browsing
"""" In-File Navigation and Tags
"Plug 'craigemery/vim-autotag'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
Plug 'unblevable/quick-scope'	" highlight the next instance of chars for f,F,t,T movement
"""" User Interface Optimizations
Plug 'skywind3000/vim-preview'
Plug 'tpope/vim-commentary'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'ervandew/supertab'
"""" Documentation and Note Taking
"Plug 'lervag/vimtex'
Plug 'vim-latex/vim-latex'
Plug 'aserebryakov/vim-todo-lists', { 'for': 'todo' }
Plug 'gu-fan/riv.vim'
Plug 'rizzatti/dash.vim', { 'on': ['Dash'] }
"""" Formatting
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
" Language Support - polyglot covers most language now
" Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
" Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'pearofducks/ansible-vim', { 'for': ['yaml', 'yml'] }
" Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
"Plug 'sheerun/vim-polyglot'
"""" Code Intelligence
"Plug 'omnisharp/omnisharp-vim', {'for': 'cs' }
Plug 'plytophogy/vim-virtualenv', { 'for': 'python' }
"Plug 'prabirshrestha/vim-lsp', { 'for': ['python', 'cs', 'dockerfile', 'cpp'] }
"Plug 'prabirshrestha/asyncomplete.vim', { 'for': [ 'python', 'cs', 'dockerfile', 'cpp'] }
"Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': ['python', 'cs', 'dockerfile', 'cpp'] }
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim', { 'for': ['python', 'cs', 'cpp'] }
""Plug 'w0rp/ale'
"Plug 'w0rp/ale', { 'for': ['python', 'cs', 'dockerfile', 'terraform', 'json', 'yaml', 'yml', 'Makefile', 'lua', 'sql', 'pgsql', 'cpp', 'xml', 'rst', 'html', 'asciidoc', 'adoc', 'bash', 'sh', 'awk', 'ruby', 'rb', 'vim'] }
"Plug 'neoclide/coc.vim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()
"}}}

syntax on
filetype plugin indent on

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


""" Tabs
" settings applied in languages/ will override
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

""" vimtex
let g:Tex_Flavor='latex'
let g:Text_ViewRule_pdf = 'preview'
let g:Imap_DeleteEmptyPlaceHolders = 1
"let g:vimtex_quickfix_mode = 0
"let g:tex_conceal='abdmg'
"set conceallevel=1

""""" Terraform 
"let g:terraform_align = 1
"let g:terraform_fmt_on_save = 1

""" vim-autotag
"let g:autotagTagsFile='tags'
"let g:autotagCtagsCmd='ctags -R --append --exclude=.git --exclude=.venv --fields=+nS .'

""" vim-repeat
" Allows . to repeat non-native mappings
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

""" Tagbar
let g:tagbar_width = 42
let g:tagbar_autofocus = 0

""" Twiggy
" let g:twiggy_group_locals_by_slash = 0
" let g:twiggy_local_branch_sort = 'mru'
" let g:twiggy_remote_branch_sort = 'date'

""" VirtualEnv
let g:virtualenv_auto_activate = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_python_auto_pipenv = 1
let b:ale_fixers = ['autopep8']
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" if value is 1, open list of errors in location window on save
let g:ale_open_list = 0
let g:ale_linters = {
			\ 'cs': ['OmniSharp'],
			\ 'python': ['flake8', 'pylint'],
			\ 'css': ['prettier'],
			\ 'dockerfile': ['hadolint'],
			\ 'terraform': ['tflint'],
			\ 'json': ['jsonlint'],
			\ 'yaml': ['yamllint', 'ansible-lint'],
			\ 'Makefile': ['checkmake'],
			\ 'lua': ['luac'],
			\ 'sql': ['sqlint'],
			\ 'pgsql': ['sqlint'],
			\ 'vim': ['vint'],
			\ 'xml': ['xmllint'],
			\ 'rst': ['alex'],
			\ 'html': ['tidy', 'alex'],
			\ 'asciidoc': ['alex'],
			\ 'adoc': ['alex'],
			\ 'sh': ['shellcheck'],
			\ 'ruby': ['brakeman']
			\}

""" asyncomplete 
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
" close preview window automatically after completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

""" asyncrun
let g:asyncrun_open = 15

""" ansible-vim
" let g:ansible_attribute_highlight = "ab"
" let g:ansible_name_highlight = "b" 
" let g:ansible_with_keywords_highlight = 'Constant'
" let g:ansible_normal_keywords_highlight = 'Constant'

""" FZF
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1    " jump to existing window if possible
let g:fzf_layout = { 'down': '~25%' }

""" Signify
let g:signify_vcs_list = [ 'git', 'perforce' ]

" }}}

" {{{  Completion

""" Omnicompletion
set completeopt-=i " do not scan included files
set completeopt+=preview,menuone,noinsert,noselect
" set omnifunc=syntaxcomplete#Complete

set path+=**    " search down into subfolders and provide tab completion
set wildmenu      " display all matching files when using tab complete
set wildmode=longest,list,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase
set smartcase      " ignore case unless specifically began with a capital
set wildchar=<Tab> wildmenu wildmode=full  " use tab completion in command mode
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

" {{{ Mappings

""""""""""""""""""""
""" All Key Mappings
""""""""""""""""""""
let mapleader="\<space>"

" Reload .vimrc
cmap src source $MYVIMRC 

nmap <silent> <leader>lp <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Async compile and run
map <F5> :call Compile_and_run()<CR>
" Call AsyncRun with custom parameters
noremap <leader>a :AsyncRun 


""""""""""""""""""
""" Toggle States
""""""""""""""""""

" Tagbar opens on right
nmap <F7> :TagbarToggle<CR>

" Remove formatting when pasting text
set pastetoggle=<F2>  

" Open 30% file explorer window on left side
noremap <silent><F4> :Vexplore<CR>

" Toggle the undo tree 
noremap <silent> <F3> :UndotreeToggle<CR>

" QuickFix and Preview Windows
nmap <F11> :call QuickFixToggle()<CR>
" Open and Close
noremap <leader>lc :lclose<CR>
noremap <leader>lo :lopen<CR>
noremap <leader>cc :cclose<CR>
noremap <leader>co :copen<CR>

" Open a terminal
nnoremap <leader>tt :terminal<CR>


"""""""""""""""""""""
""" Text Manipulation
"""""""""""""""""""""

" Write as super user
cmap w!! w !sudo tee % > /dev/null

" Show next matched string at center of screen
nnoremap n nzz
nnoremap N Nzz

" Replace word under cursor, . to repeat on next instance of word
noremap <Leader>x *``cgn
noremap <Leader>X #``cgN

" Show registers
noremap <Leader>r :reg<CR>

" Turn off highlighting until next search
noremap <Leader>, :noh<CR>

" Sort selected visual block 
vnoremap <leader>s :sort<CR>

" Yank entire buffer
nnoremap gy :%y+<CR>

" Copy current line sans leading/trailing whitespace
nnoremap gy m`^yg_``

" copy paste from system clipboard
vnoremap <leader>c ::w !pbcopy<CR><CR>
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>yy "+yy

" Delete permanently / void register
nnoremap dP "_d

" Paste the last yank / from 0 register
nnoremap yp "0p
nnoremap yP "0P

" Split line
nnoremap gK f<space>r<CR>

" Insert new line above or below, return to origin line
nnoremap <ENTER> o<ESC>k
nnoremap <leader><ENTER> O<ESC>j

" Remove trailing whitespaces from entire document
command! RemWhitespace :%s/\s\+$//<cr>:let @/=''<CR>

" Show trailing white spaces
nnoremap <leader>w :set list!<CR>

" Insert blank basic html template
nnoremap <Leader>html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" Complete current line 
inoremap <C-c> <C-x><C-l>


""""""""""""""
""" Navigation
""""""""""""""

" Switch Panes and Tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-W>z :tab split<CR>

" Switch to previously accessed split
map <C-p> <C-W><C-p>

" Resize splits with Shift+Arrows
noremap <silent> <s-left> :vertical resize -3<CR>
noremap <silent> <s-right> :vertical resize +3<CR>
noremap <silent> <s-down> :resize -3<CR>
noremap <silent> <s-up> :resize +3<CR>

" Open files quickly in the same directory as the current file
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


"""""""""""""""""""
""" Buffer Controls
"""""""""""""""""""

" Switch to last accessed buffer
noremap <leader><tab> :b#<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile


""""""""""""""""
""" FZF Control
""""""""""""""""

"  FZF Standard Search
noremap <leader>F :FZF<CR>

" FZF Buffer Search
noremap <leader>B :Buffers<CR>

" FZF Git Files Search
noremap <leader>G :GFiles<CR>

" FZF Ripgrep Search
noremap <leader>R :Rg<CR>

" FZF Search Lines in Current Buffer
noremap <leader>BL :BLines<CR>

" FZF Search Lines in loaded buffers
noremap <leader>L :Lines<CR> 

" FZF Search Windows
noremap <leader>W :Windows<CR>


""""""""""""""""""""
""" External Progams
""""""""""""""""""""

" Search Dash.app for word under cursor, current filetype
noremap <leader>d :Dash<CR>
" Search Dash.app for word under cursor, globally
noremap <leader>D :Dash!<CR>

" }}}

" {{{  Colors and Appearance

"let python_highlight_all=1
set encoding=utf-8
" set guifont=Source\ Code\ Pro\ for\ Powerline:h16
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h15
colorscheme tender
set termguicolors  " use true color
set background=dark
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1  " needed for correct colors in iterm, plus correct gutter symbols from linter and such

" airline settings
let g:airline_theme='tender'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='' " disable the arrows
let g:airline_right_sep=''
let g:airline#extensions#coc#enabled = 1
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

" Changes the window-local current directory to be the same as current file
autocmd BufEnter * silent! lcd %:p:h

" Settings for MacVim GUI Only
" if has('gui_macvim')
" 	source ~/.vim/mvimrc
" endif
