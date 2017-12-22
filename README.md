dfranklinau dotfiles
================================================================================

This is my collection of files that I use on a day-to-day basis. In this
repository is:

* `.ackrc` - configuration for [ack](https://beyondgrep.com).
* `.bash_profile` - redirects macOS to use `.bashrc`.
* `.bashrc` - aliases, Git helpers and CLI customisation.
* `.editorconfig` - configuration for [EditorConfig](http://editorconfig.org).
* `.git-completion.bash` and `.git-prompt.sh` - Git helper scripts.
* `.gitconfig` - aliases and configuration for Git.
* `.gitignore` - a boilerplate for commonly ignored files (see **About
  `.gitignore`**).
* `.vim` - assorted files for Vim, such as plugins and colour schemes.
* `.vimrc` - configuration for Vim.
* `com.googlecode.iterm2.plist` - configuration for iTerm2.





Installation
--------------------------------------------------------------------------------

Clone the repository (e.g. to `~/.dotfiles`) and run the installation script:

```
git clone git@github.com:dfranklinau/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
bash install.sh
```

Git submodules are used for managing Vim plugins.

The installation script creates symbolic links for a list of files and folders
within `~/.dotfiles`. If a file or folder already exists when creating a
symbolic link the file will be moved to `~/.dotfiles_backup`.

In the case of pre-existing folders, it is easier to manually move the folders
to another location and then run the installation script otherwise the symbolic
link may fail.





Requirements and initial configuration
--------------------------------------------------------------------------------

* macOS
* [Homebrew](https://brew.sh/)
* Vim version 8 or higher to use native Vim plugin management


### Vim configuration

I install Vim via Homebrew. The following line has been added to `.bashrc` so
that Homebrew's installation of Vim 8 is used instead of the default:

```
alias vim='/usr/local/bin/vim'
```







`.gitignore`
--------------------------------------------------------------------------------

I have purposely excluded copying `.gitignore` from the installation script.
Having a global ignore file is fine for personal projects but in a team
environment it is optimal to include a local `.gitignore` with these rules to
cater for everyone.





`.git-completion.bash` and `.git-prompt.sh`
--------------------------------------------------------------------------------

These **are not** written by me. They have been sourced from the official Git
repository.

[`.git-completion.bash`](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
adds functionality for auto completion with Git commands and branch names.

[`.git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch in the
prompt for quick reference.
