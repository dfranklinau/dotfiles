dfranklinau dotfiles
================================================================================

_Warning: may or may not contain more than just dotfiles._

This is a collection of appropriately named “dotfiles” that I use on a
day-to-day basis. The dotfiles included in this repository are:

* `.ackrc` - configuration for [ack](https://beyondgrep.com).
* `.bash_profile` - redirects macOS to use `.bashrc` (No really, that’s it).
* `.bashrc` - aliases, Git helpers and CLI customisation.
* `.emacs.d` - a directory containing `init.el` with my configuration for Emacs
  (this is for Lisp development; Vim is my primary editor).
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
bash install.sh
```

The installation script will create a symbolic link for all specified files
within `~/.dotfiles`. A simple back up process is included to prevent basic
cases of data loss. If a file already exists when creating a symbolic link the
file will be moved to `~/.dotfiles_backup`.





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


### Emacs

I install a more up-to-date copy of Emacs via Hombrew on macOS. I add the
following line to my `.bashrc` file so that I use Homebrew's installation of
Emacs over the default, where `<version>` is the version of Emacs that Homebrew
has installed::

```
alias emacs='/usr/local/Cellar/emacs/<version>/Emacs.app/Contents/MacOS/Emacs -nw'
```

Note that the `-nw` flag loads Emacs in the CLI as opposed to a GUI.

As part of running Lisp in Emacs I also install:

* [MELPA package manager](http://melpa.org);
* [Steel Bank Common Lisp](http://www.sbcl.org) (via Homebrew); and
* [SLIME](https://github.com/slime/slime/), via MELPA.





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
