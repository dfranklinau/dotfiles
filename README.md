# dotfiles

## Table of contents

* [Introduction](#introduction)
* [Installation](#installation)
* [Usage](#usage)
  * [Extending `.zshrc`](#extending-zshrc)
  * [Extending `.vimrc`](#extending-vimrc)
* [Appendix](#appendix)
  * [ack installation](#ack-installation)
  * [Global `.gitignore`](#global-.gitignore)
  * [`git-prompt.sh`](#gitpromptsh)
  * [Vim](#vim)
    * [Clipboard support](#clipboard-support)
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

```shell
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

```shell
touch ~/.zshrc-local
```

A common use is to modify the PATH:

```zsh .zsrch-local
# Load local binaries or override built-in binaries.
export PATH="$HOME/local/bin:$PATH"
```

### Extending `.vimrc`

Create a new Vim plugin:

```shell
touch ~/.vim/pack/local/start/local.vim
```

The `~/.vim/pack/local/` directory is ignored by Git so any changes will not be
tracked.





## Appendix

### ack installation

ack's installation is portable when following [Install the ack
executable](https://beyondgrep.com/install/).

Replace `~/bin/ack` with any folder already in the `$PATH` (e.g.
`~/.local/bin`).

### Global `.gitignore`

Copy `.gitignore.template` or create a symbolic link to the home directory. The
provided `.gitconfig` points to an exclude file at `~/.gitignore`, so copy or
create a link to this destination, e.g.:

```shell
ln -s ~/.dotfiles/.gitignore.template ~/.gitignore
```

### `git-prompt.sh`

[`git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
adds functionality for displaying the currently checked out Git branch and
status (e.g. if a merge or rebase is in progress) in the prompt.

There are alternatives such as the `vcs_info` module in `zsh` but I have opted
for `git-prompt.sh` because "it works".

### Vim

#### Clipboard support

Depending on the operating system, specify clipboard support using
`.vimrc-local` as follows:

```vimrc .vimrc-local
# When Neovim's `:checkhealth` reports a clipboard tool but attempting to use it
# throws the W24 error.
set clipboard = "xclip"
```

For macOS, which supports `pbcopy` and `pbpaste`, no extra configuration should
be needed.

#### `tsserver` support

```vim
call ale#Set('typescript_tsc_executable', 'tsc')   " fallback: `tsc` on $PATH
call ale#Set('typescript_tsc_use_global', get(g:, 'ale_use_global_executables', 0))

function! s:TscExecutable(buffer) abort
    return ale#path#FindExecutable(a:buffer, 'typescript_tsc', ['node_modules/.bin/tsc'])
endfunction

function! s:TscProjectRoot(buffer) abort
  for l:marker in ['tsconfig.json', 'package.json']
    let l:found = ale#path#FindNearestFile(a:buffer, l:marker)
    if !empty(l:found)
      return fnamemodify(l:found, ':h')
    endif
  endfor
  return ''
endfunction

for s:ft in ['typescript', 'typescriptreact']
  call ale#linter#Define(s:ft, {
    \   'name': 'tsc_lsp',
    \   'lsp': 'stdio',
    \   'executable': function('s:TscExecutable'),
    \   'command': '%e --lsp --stdio',
    \   'project_root': function('s:TscProjectRoot'),
    \})
endfor

let g:ale_linters = {
  \   'typescript':      ['tsc_lsp', 'biome'],
  \   'typescriptreact': ['tsc_lsp', 'biome'],
  \}

let g:ale_linters_explicit = 1

let g:ale_fixers = {
  \   'typescript':      ['biome'],
  \   'typescriptreact': ['biome'],
  \}
let g:ale_fix_on_save = 1
```

#### Vim plugins

* [ale](https://github.com/w0rp/ale) master - linting and fixing.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) 1.80 - fuzzy file finding.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) master -
  EditorConfig support.
* [emmet-vim](https://github.com/mattn/emmet-vim) master - HTML and CSS Emmet
* [gruvbox](https://github.com/morhetz/gruvbox) master - syntax theme.
* [html5.vim](https://github.com/othree/html5.vim) master - HTML5 syntax.
* [vim-commentary](https://github.com/tpope/vim-commentary) 1.3 - commenting
  shortcuts.
* [vim-fugitive](https://github.com/tpope/vim-fugitive) 3.7 - assorted
  convenience commands, e.g. `blame` and `diff`.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) main - inline Git
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
* [mise](https://mise.jdx.dev/) is used for managing versions of runtime
  languages, e.g. Node.js.
* [Neovim](https://neovim.io/) for a drop-in Vim replacement, where available.
* [`tidy-html5`](http://www.html-tidy.org) is for use with
  [Ale](https://github.com/w0rp/ale/) in Vim.
* [`pandoc`](http://pandoc.org) is a neat document conversion tool.
