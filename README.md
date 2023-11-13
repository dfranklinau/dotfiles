# dotfiles

## Table of contents

* [Introduction](#introduction)
* [Installation](#installation)
* [Usage](#usage)
  * [Extending `.zshrc`](#extending-zshrc)
  * [Extending `.vimrc`](#extending-vimrc)
* [Appendix](#appendix)
  * [Oh My Zsh](#oh-my-zsh)
  * [`git-prompt.sh`](#gitpromptsh)
  * [Vim plugins](#vim-plugins)
  * [Recommended utilities](#recommended-utilities)





## Introduction

This is a collection of files and configurations that I use on a day-to-day
basis:

* `.zshrc` - zsh and Oh My Zsh configuration.
* `.emacs` - Emacs configuration.
* `.gitconfig` - Git aliases and configuration.
* `.vim` - Vim plugins, syntax files and colour schemes.
* `.vimrc` - Vim configuration.

Template files are also included. These are intended to be copied across to new
projects where needed and serve as a reference:

* `.editorconfig.template` - [EditorConfig](http://editorconfig.org)
  configuration template.
* `.gitignore.template` - gitignore template for commonly ignored files.
* `.stylelintrc.json.template` - [stylelint](https://stylelint.io) v13.13.1
  configuration template, which uses the `stylelint-order` v4.1.0 plugin.





## Installation

Clone the repository to `~/.dotfiles` and run the installation script:

```
cd ~
git clone git@github.com:dfranklinau/dotfiles.git .dotfiles
cd .dotfiles
bash install.sh
```

The installation script creates symbolic links for a list of files and folders
within `~/.dotfiles`.

It is recommended to create a back up of any existing dotfiles that are
important prior to running, in the off-chance something goes awry.





## Usage

### Extending `.zshrc`

Create a new file:

```
~/.zshrc-local
```

This file is ignored by Git so any changes will not be tracked.

### Extending `.vimrc`

Create a new Vim plugin:

```
~/.vim/pack/local/start/local/plugin/local.vim
```

The `~/.vim/pack/local/` directory is ignored by Git so any changes will not be
tracked.





## Appendix

### Oh My Zsh

I use zsh coupled with [Oh My Zsh](https://ohmyz.sh/). Install it to ensure the
configuration within `.zshrc` works.

### `git-prompt.sh`

[`git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch and
status (e.g. if a merge or rebase is in progress) in the prompt.

### Vim plugins

* [ale](https://github.com/w0rp/ale) 3.3.0 - linting and fixing.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) 1.80 - fuzzy file finding.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) master -
  EditorConfig support.
* [emmet-vim](https://github.com/mattn/emmet-vim) master - HTML and CSS Emmet
* [gruvbox](https://github.com/morhetz/gruvbox) master - syntax theme.
* [html5.vim](https://github.com/othree/html5.vim) master - HTML5 syntax.
* [vim-commentary](https://github.com/tpope/vim-commentary) 1.3 - commenting
  shortcuts.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) master - inline Git
  diff tool.
* [vim-javascript](https://github.com/pangloss/vim-javascript) 1.2.5 -
  JavaScript syntax.
* [vim-matchup](https://github.com/andymass/vim-matchup) 0.7.3 - provides
  extended matching for the `%` operator.
* [vim-repeat](https://github.com/tpope/vim-repeat) 1.2 - enables the `.` repeat
  command with supported plugins.
* [vim-surround](https://github.com/tpope/vim-surround) 2.2 - quoting and
  parenthesising shortcuts.
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired) 2.0 - all purpose
  shortcuts.

### Recommended utilities

* [ack](https://beyondgrep.com) is used for searching through files; I find it
  easiest to install the single-file version under `~/bin/ack`.
* [nodenv](https://github.com/nodenv/nodenv/) is used for managing multiple
  versions of Node.js.
* [`tidy-html5`](http://www.html-tidy.org) is for use with
  [Ale](https://github.com/w0rp/ale/) in Vim.
* [`pandoc`](http://pandoc.org) is a neat document conversion tool.
