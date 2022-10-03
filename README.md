# dotfiles

## Table of contents

* [Introduction](#introduction)
* [Installation](#installation)
* [Usage](#usage)
  * [Extending `.zshrc`](#extending-zshrc)
  * [Extending `.vimrc`](#extending-vimrc)
* [Appendix](#appendix)
  * [Vim plugins](#vim-plugins)
  * [Recommended utilities](#recommended-utilities)





## Introduction

This is a collection of files and configurations that I use on a day-to-day
basis:

* `.zshrc` - zsh configuration.
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

### Vim plugins

* [ale](https://github.com/w0rp/ale) 2.6.0 - linting and fixing.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) 1.80 - fuzzy file finding.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) 1.1.1 -
  EditorConfig support.
* [emmet-vim](https://github.com/mattn/emmet-vim) master - HTML and CSS Emmet
* [goyo.vim](https://github.com/junegunn/goyo.vim) master - provides a
  distraction-free writing experience in Vim; good for Markdown editing.
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



### Recommended utilities

* [ack](https://beyondgrep.com) is used for searching through files.
* [nodenv](https://github.com/nodenv/nodenv/) is used for managing multiple
  versions of Node.js.
* [`tidy-html5`](http://www.html-tidy.org) is for use with
  [Ale](https://github.com/w0rp/ale/) in Vim.
* [`pandoc`](http://pandoc.org) is a neat document conversion tool.
