# Vim Config

## Setup for Windows

    git clone https://github.com/NickCrew/vim.git -b windows ~/vimfiles

*courtesty [u/romainl](https://reddit.com/u/romainl)*  

As recommended in :help vimrc, we will keep our vimrc in:

    %userprofile%\vimfiles\vimrc

But, to ensure all our stuff is correctly sourced by the other Vims, we will need a proxy vimrc that points to our actual vimrc. In %userprofile%\_vimrc, put this line and only this line:

    runtime vimrc

### Setup for Git bash Vim

Git bash Vim looks for $HOME/.vimrc first, then for $HOME/_vimrc as fallback. Since $HOME and %userprofile% both point at the same directory that's one thing we don't need to care about. The only thing we have to do is tell Vim where to look for $VIM/vimfiles so that the :runtime command in our proxy vimrc works as expected. In ~/.bash_profile:

    export VIM=$HOME

### Setup for the Linux subsystem (Ubuntu)

Just like for his Git bash cousin, we need to tell Linux Vim where to look for $VIM/vimfiles. In ~/.bashrc:

    export VIM=/mnt/c/Users/username

But our $HOME is not the same as Git bash's $HOME so we still need a proxy vimrc. This can be done with a symlink:

    $ ln -s /mnt/c/Users/username/_vimrc _vimrc

or with this line and only this line in $HOME/_vimrc:

    runtime vimrc

Conclusion

All three Vims source a proxy _vimrc that points them to our actual vimrc, located at the root of one of the default directories in 'runtimepath'. This is exactly the same workflow and the same files for each Vim.
