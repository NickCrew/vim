let g:LanguageClient_autostart = 1

if executable('clangd')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['cpp'],
        \ })
else
    echohl ErrorMsg
    echom 'Error starting clangd'
    echohl NONE
endif



