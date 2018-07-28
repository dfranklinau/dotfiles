# dotfiles

This is my collection of files that I use on a day-to-day basis. In this
repository is:

* `.ackrc` - configuration for [ack](https://beyondgrep.com).
* `.bash_profile` - redirects macOS to use `.bashrc`.
* `.bashrc` - aliases, Git helpers and CLI customisation.
* `.editorconfig` - configuration for [EditorConfig](http://editorconfig.org).
* `.git-completion.bash` and `.git-prompt.sh` - Git helper scripts.
* `.gitconfig` - aliases and configuration for Git.
* `.gitignore-template` - a boilerplate for commonly ignored files (see **About
  `.gitignore`**).
* `.stylelintrc` - configuration for [stylelint](https://stylelint.io).
* `.vim` - assorted files for Vim, such as plugins and colour schemes.
* `.vimrc` - configuration for Vim.
* `com.googlecode.iterm2.plist` - configuration for iTerm2.





## Installation

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
within `~/.dotfiles`. It is recommended that the `.vim` folder is manually
backed up and removed before installation. (This is purely to prevent anything
stuffing up, since I'm too lazy to handle existing folders right now.)





## Requirements and initial configuration

* macOS
* [Homebrew](https://brew.sh/)
* Vim version 8 or higher to use native Vim plugin management


### Useful Homebrew packages

#### Text editors

Since macOS ships with slightly old instances of Emacs and Vim the latest
versions can be installed via Homebrew.

```
brew install emacs --with-cocoa
brew install vim
```

…where the `--with-cocoa` flag installs the GNU version of Emacs.

`/usr/local/bin` needs to be defined before `/usr/bin` in the `$PATH` variable
for Homebrew versions to be loaded instead of the defaults when executed from
the command line.




#### Utilities

```
brew install ack
brew install bash-completion
brew install editorconfig
brew install nodenv
brew install tidy-html5
brew install pandoc
```

- [ack](https://beyondgrep.com) is used for searching through files.
- [`bash-completion`](https://github.com/scop/bash-completion) is used for
  adding auto completion support for various command line tools (e.g. Docker).
- [editorconfig](https://github.com/editorconfig/editorconfig-core-c/) is used
  to enable EditorConfig in Vim.
- [nodenv](https://github.com/nodenv/nodenv/) is used for managing multiple
  versions of Node.js.
- [`tidy-html5`](http://www.html-tidy.org) is for use with
  [Ale](https://github.com/w0rp/ale/) in Vim.
- [`pandoc`](http://pandoc.org) is a neat document conversion tool.





## `.gitignore-template`

I have purposely excluded copying a `.gitignore` from the installation script.
Having a global ignore file is fine for personal projects but in a team
environment it is optimal to include a local `.gitignore` with these rules to
cater for everyone.

The `.gitignore-template` in this repository provides a set of reasonable
defaults (not to be confused with `.gitignore`, which has some settings
specifically for this repository).





## `.git-completion.bash` and `.git-prompt.sh`

These **are not** written by me. They have been sourced from the official Git
repository.

[`.git-completion.bash`](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
adds functionality for auto completion with Git commands and branch names.

[`.git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch in the
prompt for quick reference.
