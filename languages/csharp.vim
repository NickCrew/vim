""" C# Settings

" Start vim-lsp for language server
let g:LanguageClient_autostart = 1

" Mappings


" Language server
if executable('omnisharp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'omnisharp',
        \ 'cmd': {server_info->['omnisharp']},
        \ 'whitelist': ['cs'],
        \ })
else
    echohl ErrorMsg
    echom 'Error loading OmniSharp server.'
    echohl NONE
endif



""" omnisharp-vim settings
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_server_use_mono = 1
