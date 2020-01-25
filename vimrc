""""""""""""""""""""""""""""""
""""" Nicholas Ferguson 2020
""""""""""""""""""""""""""""""
"{{{ 0. Plugins

call plug#begin()
"""" Appearance plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
Plug 'Nequo/vim-allomancer'
Plug 'arcticicestudio/nord-vim'
"""" Source Control
Plug 'mhinz/vim-signify'		" Show changes in gutter
Plug 'kshenoy/vim-signature'	" show marks in the gutter
Plug 'tpope/vim-fugitive'		" Git functionality
Plug 'tpope/vim-rhubarb'		" Git functionality
Plug 'mbbill/undotree'			" Tree-style undo and redo history
"""" Search
Plug '/usr/local/opt/fzf'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'	" file browsing enhancement
"""" Navigation
Plug 'ludovicchabant/vim-gutentags'		" auto generate tags
Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
Plug 'unblevable/quick-scope'		" highlight the next instance of chars for f,F,t,T movement
Plug 'skywind3000/vim-preview'		" preview tags, files and function signatures
"""" Controls
Plug 'tpope/vim-repeat'
Plug 'rizzatti/dash.vim', { 'on': ['Dash'] }
Plug 'tpope/vim-commentary'
"""" Languages
Plug 'sheerun/vim-polyglot'					" BIG language pack
Plug 'Konfekt/FastFold'						" Automatic folding
Plug 'tmhedberg/SimpylFold'					" python folding
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"""" Async
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim'
call plug#end()
"}}}

syntax on
filetype plugin indent on

"{{{  Vim Settings
" set clipboard^=unnamed " yank/dd/x to system clipboard in addition to vim register
set clipboard=autoselectplus
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

""" Tagbar
let g:tagbar_width = 42
let g:tagbar_autofocus = 0

""" asyncrun
let g:asyncrun_open = 15

""" FZF
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1    " jump to existing window if possible
let g:fzf_layout = { 'down': '~25%' }

""" Signify
let g:signify_vcs_list = [ 'git', 'perforce' ]

""" coc.vim
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

 " Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

let mapleader="\<space>"

inoremap kj <Esc>

" Reload .vimrc
cmap src source $MYVIMRC 

" asyncrun
map <F5> :call Compile_and_run()<CR>
nnoremap <silent><C-e><C-r> :call Compile_and_run()<CR>
nnoremap <silent><C-e><C-a>a :AsyncRun 

" Search Dash.app for word under cursor, current filetype
nnoremap <silent><C-e>d :Dash<CR>
" Search Dash.app for word under cursor, globally
nnoremap <silent><C-e>D :Dash!<CR>

"{{{ Toggles

" Tagbar opens on right
nnoremap <silent> <C-e>t :TagbarToggle<CR>

" Remove formatting when pasting text
set pastetoggle=<F2>  

" Open 30% file explorer window on left side
nnoremap <silent><C-e>x :Vexplore<CR>

" Toggle the undo tree 
nmap <silent><C-e><C-u> :UndotreeToggle<CR>

" Toggle quickfix
nmap <silent><C-e>c :cclose<CR>

" Open a terminal
nnoremap <silent><C-e><C-t> :terminal<CR>
"}}}

"{{{ Text Actions
" Write as super user
cmap w!! w !sudo tee % > /dev/null

" Show next matched string at center of screen
nnoremap n nzz
nnoremap N Nzz

" Replace word under cursor, . to repeat on next instance of word
noremap <Leader>x *``cgn
noremap <Leader>X #``cgN

" Show registers
nnoremap <silent><C-e>r :reg<CR>

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
"}}}

"{{{ Windows

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

"}}}

"{{{ Buffer Controls

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
"}}}

"{{{ FZF Controls
"  FZF Standard Search
nnoremap <C-e>f :FZF<CR>
" FZF Buffer Search
nnoremap <C-e>b :Buffers<CR>
" FZF Git Files Search
nnoremap <C-e>g :GFiles<CR>
" FZF Search Lines in Current Buffer
nnoremap <C-e>l :BLines<CR>
"}}}

" }}}

" {{{  Colors and Appearance

"let python_highlight_all=1
set encoding=utf-8
" set guifont=Source\ Code\ Pro\ for\ Powerline:h16
" set guifont=Fira\ Mono\ Medium\ for\ Powerline:h15
set guifont=MesloLGS\ NF:h15
colorscheme onedark
set termguicolors  " use true color
set background=dark
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1  " needed for correct colors in iterm, plus correct gutter symbols from linter and such

" airline settings
let g:airline_theme='onedark'
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
