call plug#begin('~/vimfiles/plugged')
Plug 'tpope/vim-commentary'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-vinegar'
"Plug 'mhinz/vim-signify'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'skywind3000/vim-preview'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
"Plug 'romainl/vim-qf'
Plug 'romainl/vim-devdocs'
"Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

filetype plugin indent on
syntax on

set clipboard=unnamed
set backspace=indent,eol,start
set ttimeoutlen=2
set virtualedit=block
set mouse=a
set nocompatible
set hidden
set encoding=utf-8

set nobackup
set nowritebackup
set directory=~/vimfiles/swap//
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/vimfiles/undo//

set splitbelow
set splitright

set textwidth=79
set number
set autoindent
set smarttab
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

set hlsearch
set incsearch

" For coc.vim
set cmdheight=2
set shortmess+=c
set updatetime=300

" Completion
set completeopt-=i
set complete-=t
set completeopt+=preview,menu
set path+=**
set wildmenu
set wildmode=longest,list,full
set smartcase
set wildignorecase


let g:airline#extensions#tabline#enabled = 1
if has('gui_running')
	source ~/vimfiles/gvimrc
endif

" k always uses devdocs
"set keywordrpg=:DD

""" Mappings
""""""""""""
let mapleader="\<space>"

inoremap kj <Esc>

" Reload .vimrc
cmap src source $MYVIMRC

" Toggle quick fix
map <C-w>q <Plug>(qf_qf_toggle)

" Remove formatting when pasting text
set pastetoggle=<F2>

" Open 30% file explorer window on left side
map <C-w>e :Vexplore<CR>

" Toggle the undo tree
map <silent> <F3> :UndotreeToggle<CR>

" Open a terminal
map <C-w>t :terminal<CR>


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

" Show marks
noremap <leader>m :marks<CR>

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


