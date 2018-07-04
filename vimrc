execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on


augroup Python
     au!
     autocmd FileType python set textwidth=79
     autocmd FileType python set autoindent
augroup END

" VimCompletesMe
let b:vcm_tab_complete = 'vim'

""""""""""Syntastic!"""""""""""""
"""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 " do not check on open
let g:syntastic_check_on_wq = 0 " do not check on save and close


""""""""""""Pymode"""""""""""""""
"""""""""""""""""""""""""""""""""
"let g:pymode_python = 'python3'
"let g:pymode_rope_completion = 1


""""""""Colors and Themes"""""""""
""""""""""""""""""""""""""""""""""
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set t_Co=256    " 256 color support
set background=dark
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let python_highlight_all=1

""""""""""""Settings""""""""""""""
""""""""""""""""""""""""""""""""""
set clipboard=unnamed " enable system clipboard
set ttimeoutlen=2
set backup
set backupdir=~/.vim/backup
set writebackup
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set noswapfile
set nocompatible
set mouse=a          " enable mouse

""" Tabs
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 " python tabs
set smarttab

""" Display options
set cursorline
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


""""""""""""Completions"""""""""""
""""""""""""""""""""""""""""""""""
set path+=**    " search down into subfolders and provide tab completion
set wildmenu      " display all matching files when using tab complete
set wildmode=longest,list,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase
set smartcase      " ignore case unless specifically began with a capital


"""""""""File Browsing""""""""""""
""""""""""""""""""""""""""""""""""
noremap <silent> <F4> :NERDTreeToggle<CR>

""" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"""""GunDo - Undo Manager"""""""""
""""""""""""""""""""""""""""""""""
noremap <silent> <F3> :GundoToggle<CR>


"""""""""Custom Mappings""""""""""
""""""""""""""""""""""""""""""""""
"""" Do not map <C-a>/<C-b> as these are used by tmux
""""""""""""""""""""""""""""""""""

let mapleader = ","
inoremap kj <esc>

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
nnoremap <Leader>. :noh<CR>

" Sort selected visual block 
vnoremap <leader>s :sort<CR>

" Yank entire buffer
nnoremap gy :%y+<CR>

" Copy current line sans leading/trailing whitespace
nnoremap gy m`^yg_``

" copy paste from system clipboard
vnoremap <leader>c ::w !pbcopy<CR><CR>
nnoremap <leader>p "+p

" Split line
nnoremap gK f<space>r<CR>

" Insert new line above or below, return to origin line
noremap <ENTER> o<ESC>k
noremap <leader><ENTER> O<ESC>j

" Resize panes 
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


"""""""""Abbreviations"""""""""""
"""""""""""""""""""""""""""""""""
