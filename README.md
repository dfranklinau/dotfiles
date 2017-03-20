dfranklinau dotfiles
================================================================================

This is a collection of appropriately named “dotfiles” that I use on a
day-to-day basis. The dotfiles included in this repository are:

* `.gitconfig` - for Git aliases and essential configuration.
* `.gitignore` - a boilerplate for ignoreable files (see “About `.gitignore`”).
* `.vimrc` - for my personalised Vim configuration.
* `.bashrc` - for a few helpful additions to Terminal (mostly for Git).
* `.bash_profile` - redirects macOS to use `.bashrc` (No really, that’s it).


Installation
--------------------------------------------------------------------------------

Clone the repository to `~.dotfiles` and run the installation script:

```
git clone git@github.com:dfranklinau/dotfiles.git ~/.dotfiles
cd .dotfiles
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
