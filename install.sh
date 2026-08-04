#!/bin/bash

################################################################################
# This script creates symbolic links from the home directory to the dotfiles
# located in `~/.dotfiles`.
#
# To install, clone the dotfiles repository to `~/.dotfiles`, enter the
# directory and run `bash install.sh`. If errors arise from creating links, the
# target directory may need to be removed.
################################################################################

TS=$(date +%Y%m%d%H%M%S)
SOURCE="$HOME/.dotfiles"
TARGET="$HOME"
BACKUP="$TARGET/.dotfiles-backup.$TS"

# All of the files and directories to be linked.
ITEMS=(
  ".config/nvim"
  ".emacs"
  ".gitconfig"
  ".vimrc"
  ".vim"
  ".zshrc"
  "git-prompt.sh"
)

# Set to 0 to allow overwriting without backups.
ENABLE_BACKUP=1

for item in "${ITEMS[@]}"; do
  src="$SOURCE/$item"
  dst="$TARGET/$item"

  # Ensure the parent directory for the destination exists.
  dst_parent=$(dirname "$dst")
  mkdir -p "$dst_parent"

  # Remove the destination if it exists, creating a backup if enabled.
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    if [ "$ENABLE_BACKUP" -eq 1 ]; then
      dst_backup="$BACKUP/$item"
      mkdir -p "$(dirname "$dst_backup")"
      mv "$dst" "$dst_backup"
    else
      echo "rm -rf "$dst""
    fi
  fi

  # Create a symbolic link.
  ln -s "$src" "$dst"
  echo "Linked: $dst -> $src"
done
