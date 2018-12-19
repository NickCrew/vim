
" for imp module deprecated warining when using macvim
" if has('python3') && !has('patch-8.1.201')
"   silent! python3 1
" endif

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


""""" Python Settings
 """ F8 to execute code in current buffer
set textwidth=79
set foldmethod=indent
set autoindent
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 " python tabs
	 
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


