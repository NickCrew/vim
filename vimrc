""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2018
"""""
""""" Vimmin' it up dawg
""""""""""""""""""""""""""""""
"""""
""""" 1. Language Settings
""""" 2. Custom Functions
""""" 3. Plugin Settings
""""" 4. Colors
""""" 5. General Settings
""""" 6. Completions
""""" 7. netrw
""""" 8. Custom Mappings
""""" 9. Abbreviations
"""""
""""""""""""""""""""""""""""""

call plug#begin()
Plug 'vim-scripts/taglist.vim'
Plug 'diepm/vim-rest-console'
Plug 'rakr/vim-one'
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive' " Git functionality
Plug 'sodapopcan/vim-twiggy' " extension to fugitive
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
Plug 'rizzatti/dash.vim' 
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'aserebryakov/vim-todo-lists' 
Plug 'sjl/gundo.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/vim-lsp', { 'for': 'python' }  " Plugins to enable Python IDE-like functionality start here 
Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'python' }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': 'python' }
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale', { 'for': 'python' }
call plug#end()

syntax on
filetype plugin indent on


""""" 1. Language Settings
"""""""""""""""""""""""""""

" for imp module deprecated warining when using macvim
if has('python3') && !has('patch-8.1.201')
  silent! python3 1
endif


""""" Python Settings
""" F8 to execute code in current buffer
augroup Python
     au!
     autocmd FileType python set textwidth=79
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
augroup END


""""" Terraform 
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1


""""" JSON
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END


"""""" 2. Custom Functions
"""""""""""""""""""""""""""

""""" Async Quick Run
nnoremap <F6> :call <SID>compile_and_run()<CR>

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


"""""" 3. Plugin Settings
""""""""""""""""""""""""""

""" Twiggy
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

""" VirtualEnv
let g:virtualenv_auto_activate = 1

""" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1

""" vim-lsp
let g:LanguageClient_autostart = 1

""" asyncomplete & asyncomplete-lsp
let g:asyncomplete_remove_duplicates = 1

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




""""" 4. Colors and Themes
"""""""""""""""""""""""

let python_highlight_all=1
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
"let g:gruvbox_contrast_dark='medium'
colorscheme one
"set t_Co=256    " 256 color support
set termguicolors

" airline settings
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='' " disable the arrows
let g:airline_right_sep=''

set background=dark

""""" 5. Settings
""""""""""""""""""
" set clipboard^=unnamed " yank/dd/x to system clipboard in addition to vim register
set ttimeoutlen=2
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set noswapfile
set nocompatible
set mouse=a          " enable mouse

""" Omnicompletion
set completeopt-=i " do not scan included files
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
set relativenumber    " line numbers relative to current position
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
set winminwidth=0      " minimum width of pane

""" Text Organization
set foldmethod=indent
set breakindent
set showbreak=\\\

""" Paste
set pastetoggle=<F2>   " Remove formatting when pasting text


""""" 6. Completions
"""""""""""""""""""""
set path+=**    " search down into subfolders and provide tab completion
set wildmenu      " display all matching files when using tab complete
set wildmode=longest,list,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase
set smartcase      " ignore case unless specifically began with a capital


""""" 7. netrw
"""""""""""""""

" Open 30% explorer window on left side
noremap <silent><F4> :Vexplore<CR>
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
let g:netrw_winsize = 30
" open file in a previous buffer (right window)
let g:netrw_browse_split = 4
" buffer setting
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap number'


""""" 8. Custom Mappings
"""""""""""""""""""""""""""""""
" Do not map <C-a>/<C-b> as
" these are often used by tmux
"""""""""""""""""""""""""""""""

let mapleader="\<space>"
inoremap kj <esc>

" quickly save
noremap Q :w<CR>

noremap <silent> <F3> :GundoToggle<CR>

" Open FZF for current dir
noremap <leader>f :FZF<CR>

" Open buffer search in FZF
noremap <silent> <F7> :Buffers<CR>

" Reload .vimrc
cmap src source $MYVIMRC 

" Write as super user
cmap w!! w !sudo tee % > /dev/null


" Show next matched string at center of screen
nnoremap n nzz
nnoremap N Nzz

" Show registers
noremap <Leader>r :reg<CR>

" Fast save
noremap <Leader>m :w<CR>

" Turn off highlighting until next search
nnoremap <Leader>, :noh<CR>

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

" Split line
nnoremap gK f<space>r<CR>

" Insert new line above or below, return to origin line
noremap <ENTER> o<ESC>k
noremap <leader><ENTER> O<ESC>j

" Resize windows 
nnoremap <leader><up> :res +2<CR>
nnoremap <leader><down> :res -2<CR>
nnoremap <leader>h :vertical resize +3<CR>
nnoremap <leader>l :vertical resize -3<CR>

" Remove trailing whitespaces from entire document
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Show trailing white spaces
noremap <leader>w :set list!<CR>

" Insert blank basic html template
nnoremap <Leader>html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" complete current line 
inoremap <C-c> <C-x><C-l>

" Pane and tab Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" vim-virtualenv plugin
nnoremap <leader>vl :VirtualEnvList<CR>
nnoremap <leader>vd :VirtualEnvDeactivate<CR>
nnoremap <leader>va :VirtualEnvActivate


"""""" 9. Abbreviations
""""""""""""""""""""""""
