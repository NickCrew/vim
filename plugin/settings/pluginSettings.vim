""""" Terraform 
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

""" vim-autotag
let g:autotagTagsFile="tags"
let g:autotagCtagsCmd="ctags -R --append --exclude=.git --exclude=.venv --fields=+nS ."

""" vim-repeat
" Allows . to repeat non-native mappings
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

""" Tagbar
let g:tagbar_width = 42
let g:tagbar_autofocus = 0

""" Twiggy
" let g:twiggy_group_locals_by_slash = 0
" let g:twiggy_local_branch_sort = 'mru'
" let g:twiggy_remote_branch_sort = 'date'

""" VirtualEnv
let g:virtualenv_auto_activate = 1

""" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_python_auto_pipenv = 1
let b:ale_fixers = ['autopep8']
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" if value is 1, open list of errors in location window on save
let g:ale_open_list = 0
let g:ale_linters = {
			\ 'cs': ['OmniSharp'],
			\ 'css': ['prettier'],
			\ 'python': ['pylint', 'flake8'],
			\ 'dockerfile': ['hadolint'],
			\ 'terraform': ['tflint'],
			\ 'json': ['jsonlint'],
			\ 'yaml': ['yamllint', 'ansible-lint'],
			\ 'Makefile': ['checkmake'],
			\ 'lua': ['luac'],
			\ 'sql': ['sqlint'],
			\ 'pgsql': ['sqlint'],
			\ 'cpp': ['clangd'],
			\ 'vim': ['vint'],
			\ 'xml': ['xmllint'],
			\ 'rst': ['alex'],
			\ 'html': ['tidy', 'alex'],
			\ 'asciidoc': ['alex'],
			\ 'adoc': ['alex'],
			\ 'sh': ['shellcheck'],
			\ 'ruby': ['brakeman']
			\}


""" asyncomplete 
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
" close preview window automatically after completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

""" asyncrun
let g:asyncrun_open = 15

""" ansible-vim
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = "b" 
let g:ansible_with_keywords_highlight = 'Constant'
let g:ansible_normal_keywords_highlight = 'Constant'

""" FZF
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1    " jump to existing window if possible
let g:fzf_layout = { 'down': '~25%' }


