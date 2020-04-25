call plug#begin(~/.vim/data)
Plug 'unblevable/quick-scope'   " highlight markers for tT/fF
Plug 'tpope/vim-commentary'     " better commenting
Plug 'tpope/vim-vinegar'		" file browsing enhancement
Plug 'kshenoy/vim-signature'	" show marks in the gutter
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
filetype plugin indent on

source ~/.vim/mappings.vim 

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set clipboard=unnamedplus
set backspace=indent,eol,start
set lazyredraw
set virtualedit=block

set splitbelow
set splitright

set number
set textwidth=79
set autoindent
set smarttab
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

set completeopt-=i
set completeopt+=preview,menu
set path+=**
set wildmenu
set wildmode=longest,list,full
set smartcase
set wildignorecase
set wildchar=<Tab>
