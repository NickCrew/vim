""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2018
""""""""""""""""""""""""""""""

"{{{ 0. Plugins
call plug#begin()
Plug 'tpope/vim-repeat'
Plug 'gu-fan/riv.vim'
Plug 'skywind3000/vim-preview'
Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
" Plug 'diepm/vim-rest-console'
Plug 'rakr/vim-one'
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
Plug 'pearofducks/ansible-vim', { 'for': 'yaml' }
Plug 'unblevable/quick-scope'	" highlight the next instance of chars for f,F,t,T movement
Plug 'ervandew/supertab'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'rizzatti/dash.vim', { 'on': ['Dash'] }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'aserebryakov/vim-todo-lists', { 'for': 'todo' }
Plug 'mbbill/undotree'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/vim-lsp', { 'for': 'python' }	 
Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'python' }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': 'python' }
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale',
call plug#end()
syntax on
filetype plugin indent on


"}}}

" {{{ 1. Language Settings
"
" for imp module deprecated warining when using macvim
if has('python3') && !has('patch-8.1.201')
  silent! python3 1
endif


""""" Python Settings
 """ F8 to execute code in current buffer
augroup Python
     au!
     autocmd FileType python set textwidth=79
	 autocmd FileType python set foldmethod=indent
     autocmd FileType python set autoindent
     autocmd FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 " python tabs
     autocmd FileType python  nnoremap <buffer> <F8> :exec '!clear; python' shellescape(@%, 1)<cr>
augroup END

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


""""" Yaml / Ansible 
augroup Yaml / Ansible
    au!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab 
	autocmd FileType yaml set foldmethod=indent
augroup END


""""" Terraform 
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1


""""" JSON
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
"}}}

"{{{ 2. Custom Functions



""""" Async Quick Run

function! s:compile_and_run()
     exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction


""""" Python Language Server
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
else
    echohl ErrorMsg
    echom 'pyls not installed'
    echohl NONE
endif
"}}}

"{{{  3. Plugin Settings

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
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

""" VirtualEnv
let g:virtualenv_auto_activate = 1

""" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_python_auto_pipenv = 1
let b:ale_fixers = ['autopep8']
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""" vim-lsp
let g:LanguageClient_autostart = 1

""" asyncomplete 
" close preview window automatically after completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1


""" asyncrun
let g:asyncrun_open = 15

""" ansible-vim
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = "b" 
let g:ansible_with_keywords_highlight = 'Constant'
let g:ansible_normal_keywords_highlight = 'Constant'

""" FZF
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

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1    " jump to existing window if possible
let g:fzf_layout = { 'down': '~45%' }
"}}}

"{{{  4. Colors and Themes
" let python_highlight_all=1
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
"let g:gruvbox_contrast_dark='medium'
colorscheme one
"set t_Co=256    " 256 color support
set termguicolors
set background=dark

" airline settings
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='' " disable the arrows
let g:airline_right_sep=''

"}}}

"{{{  5. Settings
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

"{{{  6. Completions
set path+=**    " search down into subfolders and provide tab completion
set wildmenu      " display all matching files when using tab complete
set wildmode=longest,list,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase
set smartcase      " ignore case unless specifically began with a capital
"}}}

"{{{  7. netrw

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
"}}}

"{{{  8. Custom Mappings
" Do not map <C-a>/<C-b> as
" these are often used by tmux
"""""""""""""""""""""""""""""""

let mapleader="\<space>"

"""  8A. Toggles
" F8 is set to run python code, only if the filetype is *.py

" QuickFix Window
map <F11> :call QuickFixToggle()<CR>

" Tagbar opens on right
nmap <F7> :TagbarToggle<CR>

" AsyncRun - Compile and Run
nnoremap <F6> :call <SID>compile_and_run()<CR>

" Remove formatting when pasting text
set pastetoggle=<F2>  

" Open 30% explorer window on left side
noremap <silent><F4> :Vexplore<CR>

" Toggle the undo tree 
noremap <silent> <F3> :UndotreeToggle<CR>

" Search Dash.app for word under cursor, current filetype
noremap <leader>d :Dash<CR>

" Search Dash.app for word under cursor, globally
noremap <leader>D :Dash!<CR>

noremap <leader>n :bnext<CR> 
noremap <leader>b :bprev<CR>


""" 8B. FZF Search Mappings

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


" Buffer Navigation
noremap <leader><tab> :b#<CR>
nmap <F9> :bprev<CR>
nmap <F10> :next<CR>

" Reload .vimrc
cmap src source $MYVIMRC 

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

" Pane and tab Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-W>z :tab split<CR>

" Switch to previously accessed split
map <C-p> <C-W><C-p>

" Open a terminal
nnoremap <leader>tt :terminal<CR>

" Resize splits with Shift+Arrows
noremap <silent> <s-left> :vertical resize -3<CR>
noremap <silent> <s-right> :vertical resize +3<CR>
noremap <silent> <s-down> :resize -3<CR>
noremap <silent> <s-up> :resize +3<CR>
"}}}

"{{{ 9. Abbreviations
"}}}
