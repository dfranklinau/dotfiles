#!/bin/bash

################################################################################
# This script creates symbolic links from the home directory to the dotfiles
# located in `~/.dotfiles`.
#
# To install, clone the dotfiles repository to `~/.dotfiles`, enter the
# directory and run `bash install.sh`. If errors arise from creating links, the
# target directory may need to be removed.
################################################################################


src=~/.dotfiles
backup=~/.dotfiles_backup
dest=~
dotfiles=(
  ".ackrc"
  ".bashrc"
  ".bash_profile"
  ".emacs"
  ".gitconfig"
  ".git-completion.bash"
  ".git-prompt.sh"
  ".vimrc"
  ".vim"
  "com.googlecode.iterm2.plist"
)


# Warn the user about cleaning the '~/.dotfiles_backup' folder.
if [ -d $backup ]; then

  read -p "The '~/.dotfiles_backup' folder already exists. For this script to work, the folder will need to be emptied in the event of a file name collision. Are you sure you want to DELETE EVERY FILE from '~./dotfiles_backup'? (y/n) "
  echo # Add a blank line for breathing space.

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf $backup
    mkdir $backup
  else
    exit 0
  fi

else

  mkdir $backup

fi


# Create a symbolic link from '~/.dotfiles' to '~/' for all files. Backup any
# files that may have the same filename in '~./dotfiles_backup'.
for dotfile in ${dotfiles[@]}; do

  echo "Linking '~/.dotfiles/$dotfile' to '~/$dotfile'..."

  if [ -f $dest/$dotfile ]; then
    echo "Oh, '$dotfile' already exists. Moving it to '~./dotfiles_backup/$dotfile'."
    mv $dest/$dotfile $backup/
  fi

  ln -s $src/$dotfile $dest/$dotfile

  echo "Linked '~/.dotfiles/$dotfile'."
  echo # Add a blank line for breathing space.

done

echo "All dotfiles have been linked, hooray."
