dfranklinau dotfiles
================================================================================

_Warning: may or may not contain more than just dotfiles._

This is a collection of appropriately named “dotfiles” that I use on a
day-to-day basis. The dotfiles included in this repository are:

* `.ackrc` - configuration for [ack](https://beyondgrep.com).
* `.bash_profile` - redirects macOS to use `.bashrc` (No really, that’s it).
* `.bashrc` - aliases, Git helpers and CLI customisation.
* `.editorconfig` - configuration for [EditorConfig](http://editorconfig.org).
* `.git-completion.bash` and `.git-prompt.sh` (see **`.git-completion.bash` and
  `.git-prompt.sh`** for more information).
* `.gitconfig` - aliases and configuration for Git.
* `.gitignore` - a boilerplate for commonly ignored files (see **About
  `.gitignore`**).
* `.vimrc` - configuration for Vim.
* `com.googlecode.iterm2.plist` - configuration for iTerm2.





Installation
--------------------------------------------------------------------------------

Clone the repository to `~/.dotfiles` and run the installation script:

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





Requirements
--------------------------------------------------------------------------------

These files have not been tested anywhere but macOS so there may be some
portability issues. That being said, at the end of the day these are _my_
dotfiles.


### Vim

I install a more up-to-date copy of Vim using Homebrew on macOS. I add the
following line to my `.bashrc` file so that I use Homebrew's installation of Vim
over the default:

```
alias vim='/usr/local/bin/vim'
```

I also use [Vim Plug](https://github.com/junegunn/vim-plug) as a plugin manager
for Vim.





About `.gitignore`
--------------------------------------------------------------------------------

I have purposely excluded copying `.gitignore` from the installation script
because I want to enforce the fact that global `.gitignore` files are a semi-bad
practice. They are fine for personal projects but in team environments it is
preferred to include a local `.gitignore` with these rules to cater for
everyone.





`.git-completion.bash` and `.git-prompt.sh`
--------------------------------------------------------------------------------

These **are not** something I have written. They have been sourced from the
official Git repository.

[`.git-completion.bash`](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
adds functionality for auto completion with Git commands and branch names.

[`.git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch in the
prompt for quick reference.
