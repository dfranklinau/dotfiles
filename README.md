dfranklinau dotfiles
================================================================================

This is a collection of appropriately named “dotfiles” that I use on a
day-to-day basis. The dotfiles included in this repository are:

* `.bash_profile` - redirects macOS to use `.bashrc` (No really, that’s it).
* `.bashrc` - for a few helpful additions to Terminal (mostly for Git).
* `.git-completion.bash` and `.git-prompt.sh` - helper scripts from the official
  Git repository to add useful functionality (see **`.git-completion.bash` and
  `.git-prompt.sh`**).
* `.gitconfig` - for Git aliases and essential configuration.
* `.gitignore` - a boilerplate for ignoreable files (see **About `.gitignore`**)
* `.vimrc` - for my personalised Vim configuration.


Installation
--------------------------------------------------------------------------------

Clone the repository to `~.dotfiles` and run the installation script:

```
git clone git@github.com:dfranklinau/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

The installation script will create a symbolic for every dotfile within 
`~/.dotfiles`. A simple back up process is included to prevent basic cases of 
data loss. If a file already exists when creating a symbolic link the file will
be moved to `~/.dotfiles_backup`.


About `.gitignore`
--------------------------------------------------------------------------------

I have purposely excluded copying `.gitignore` from the installation script
because I want to enforce the fact that global `.gitignore` files are a
semi-bad practice. They are fine for personal projects but in team environments
it is preferred to include a local `.gitignore` with these rules to cater for
everyone.


`.git-completion.bash` and `.git-prompt.sh`
--------------------------------------------------------------------------------

These **are not** something I have written. They have been sourced from the
official Git repository.

[`.git-completion.bash`](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
adds functionality for auto completion with Git commands and branch names.

[`.git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch in
the prompt for quick reference.
