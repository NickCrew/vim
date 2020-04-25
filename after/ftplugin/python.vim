 """ F8 to execute code in current buffer
setlocal textwidth=79
setlocal foldmethod=indent
setlocal autoindent
setlocal smarttab
setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 " python tabs
	 
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


