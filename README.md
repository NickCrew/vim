# My Vim Repo

* __My vim environment is optimized primarily for:__ Python, Ansible, Hashicorp tools, Asciidoc and markdown editing.
* __For python code completion to work:__ you will need to python-lsp-server package installed on your system.  
* __If you want linting (ALE) to work:__ you will need a linter installed on your system such as flake8 or pylint.
* You need the patched powerline fonts for vim-airline: https://github.com/powerline/fonts 

__To install plugins you need to:__  
1. `mkdir -p ~/.vim/plugged`  
2. Run `:PlugInstall` inside of vim  
I use *vim-plug*: https://github.com/junegunn/vim-plug  

Traditional Vim wisdom says you should try not to use unnecessary plug-ins or at least explore Vim's native
functionality first to see what your needs are. I agree but you are your own human (hopefully).
