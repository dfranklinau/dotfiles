# dotfiles

## Table of contents

* [Introduction](#introduction)
* [Requirements](#requirements)
* [Installation](#installation)
  * [macOS](#installation-macos)
  * [Linux](#installation-linux)
* [Miscellaneous](#miscellaneous)
    * [Text editors](#text-editors)
    * [Homebrew packages](#homebrew-packages)
    * [Extending `.vimrc`](#extending-vimrc)
    * [Vim plugins](#vim-plugins)
    * [`.gitignore-template`](#gitignore-template)
    * [`.git-completion.bash` and `.git-prompt.sh`](#git-completionbash-and-git-promptsh)





## Introduction

This is a collection of files and configurations that I use on a day-to-day
basis. It contains:

* `.ackrc` - configuration for [ack](https://beyondgrep.com).
* `.bash_profile` - redirects macOS to use `.bashrc`.
* `.bashrc` - aliases, Git helpers and CLI customisation.
* `.editorconfig` - configuration for [EditorConfig](http://editorconfig.org).
* `.emacs` - configuration for Emacs.
* `.git-completion.bash` and `.git-prompt.sh` - Git helper scripts.
* `.gitconfig` - aliases and configuration for Git.
* `.gitignore-template` - a boilerplate for commonly ignored files (see **About
  `.gitignore`**).
* `.stylelintrc` - configuration for [stylelint](https://stylelint.io) (based on
  v8.0.0).
* `.vim` - assorted files for Vim, such as plugins and colour schemes.
* `.vimrc` - configuration for Vim.
* `com.googlecode.iterm2.plist` - configuration for iTerm2.





## Requirements

* Vim 8 (for native Vim plugin management)
* EditorConfig
* [Homebrew](https://brew.sh/) (macOS only)





## Installation

Clone the repository `~/.dotfiles` and run the installation script:

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
backed up and removed before installation. (This is to prevent things from
stuffing up since I'm too lazy to handle existing folders.)


### macOS

For EditorConfig to work, it must be installed via Homebrew:

```
brew install editorconfig
```


### Linux

For EditorConfig to work, it must be installed using the appropriate package
manager, e.g.:

```
apt-get install editorconfig
```





## Miscellaneous

### Text editors

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


### Additional packages

While not required per se, I find the following packages useful enough to
warrant their own section.

* [ack](https://beyondgrep.com) is used for searching through files.
* [`bash-completion`](https://github.com/scop/bash-completion) is used for
  adding auto completion support for various command line tools (e.g. Docker).
* [editorconfig](https://github.com/editorconfig/editorconfig-core-c/) is used
  to enable EditorConfig in Vim.
* [nodenv](https://github.com/nodenv/nodenv/) is used for managing multiple
  versions of Node.js.
* [`tidy-html5`](http://www.html-tidy.org) is for use with
  [Ale](https://github.com/w0rp/ale/) in Vim.
* [`pandoc`](http://pandoc.org) is a neat document conversion tool.


### Extending `.vimrc`

Create a new Vim plugin at the following path:

```
~/.vim/pack/dfranklinau-extends/start/dfranklinau/plugin/dfranklinau.vim
```

The `dfranklinau-extends` folder is ignored by Git so any changes to it will not
create a diff in the repository.

Machine-specific plugins can also be cloned into this repository and manually
managed, i.e. added via `git clone` instead of `git submodule add`.


### Vim plugins

I use the following Vim plugins:

* [ale](https://github.com/w0rp/ale) 2.6.0 - linting and fixing.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) 0.3.3 -
  EditorConfig support.
* [emmet-vim](https://github.com/mattn/emmet-vim) master - HTML and CSS Emmet
  syntax support.
* [html5.vim](https://github.com/othree/html5.vim) master - HTML5 syntax.
* [vim-commentary](https://github.com/tpope/vim-commentary) 1.3 - commenting
  shortcuts.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) master - inline Git
  diff tool.
* [vim-matchit](https://github.com/adelarsq/vim-matchit) master - provides
  extended matching for the `%` operator.
* [vim-javascript](https://github.com/pangloss/vim-javascript) 1.2.5 -
  JavaScript syntax.
* [vim-repeat](https://github.com/tpope/vim-repeat) 1.2 - enables the `.` repeat
  command with supported plugins.
* [vim-surround](https://github.com/tpope/vim-surround) 2.1 - quoting and
  parenthesising shortcuts.
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired) 2.0 - all purpose
  shortcuts.


### `.gitignore-template`

I have purposely excluded copying a `.gitignore` from the installation script.
Having a global ignore file is fine for personal projects but in a team
environment it is optimal to include a local `.gitignore` with these rules to
cater for everyone.

The `.gitignore-template` in this repository provides a set of reasonable
defaults (not to be confused with `.gitignore`, which has some settings
specifically for this repository).


### `.git-completion.bash` and `.git-prompt.sh`

These **are not** written by me. They have been sourced from the official Git
repository.

[`.git-completion.bash`](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
adds functionality for auto completion with Git commands and branch names.

[`.git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch in the
prompt for quick reference.
