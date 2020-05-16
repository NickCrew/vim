" " Dockerfile settings
" let g:LanguageClient_autostart = 1

" " Activate language server
" if executable('docker-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'docker-langserver',
"         \ 'cmd': {server_info->['docker-langserver']},
"         \ 'whitelist': ['docker-langserver'],
"         \ })
" else
"     echohl ErrorMsg
"     echom 'Error starting docker-langserver'
"     echohl NONE
" endif



