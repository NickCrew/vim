""""""""""""""""""""""""
" General Key Mappings "
""""""""""""""""""""""""
let mapleader="\<space>"

" Close location pane
noremap <leader>lc :lclose<CR>
noremap <leader>lo :lopen<CR>
noremap <leader>cc :cclose<CR>
noremap <leader>co :copen<CR>

"""  8A. Toggles

noremap <leader>a :AsyncRun 

" Async compile and run
map <F5> :call Compile_and_run()<CR>

" QuickFix Window
nmap <F11> :call QuickFixToggle()<CR>

" Tagbar opens on right
nmap <F7> :TagbarToggle<CR>

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

" Open files quickly in the same directory as the current file
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


