"
" Python Settings
"
setlocal textwidth=79
setlocal foldmethod=indent
setlocal tabstop=4 
setlocal softtabstop=4 
setlocal shiftwidth=4
setlocal expandtab 
setlocal smarttab
setlocal autoindent
		 
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


