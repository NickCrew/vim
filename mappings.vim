""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Vim Main Key Mappings
"""
""" File Name:      mappings.vim
""" Last Modif:     Mar 26 2020
""" Last Contrib:   nferguson
"""
""" Notes:
""" Can be used by vanilla vim or neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="\<space>"

inoremap kj <Esc>

" Reload .vimrc
cmap src source $MYVIMRC

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
