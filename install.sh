#!/bin/bash

################################################################################
# This script creates symbolic links from the home directory to the dotfiles
# located in `~/.dotfiles`.
#
# To install, clone the dotfiles repository to `~/.dotfiles`, enter the
# directory and run `bash install.sh`.
################################################################################


src=~/.dotfiles
backup=~/.dotfiles_backup
dest=~
files=(
	".ackrc"
	".bashrc"
	".bash_profile"
	".emacs.d/init.el"
	".gitconfig"
	".git-completion.bash"
	".git-prompt.sh"
	".vimrc"
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
for file in ${files[@]}; do

	echo "Linking '~/.dotfiles/$file' to '~/$file'..."

	if [ -f $dest/$file ]; then
		echo "Oh, '$file' already exists. Moving it to '~./dotfiles_backup/$file'."
		mv $dest/$file $backup/
	fi

	ln -s $src/$file $dest/$file

	echo "Linked '~/.dotfiles/$file'."
	echo # Add a blank line for breathing space.

done

echo "All dotfiles have been linked, hooray."
