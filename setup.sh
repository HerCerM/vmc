#!/bin/sh

# This script is meant to be run in Git Bash, with the working directory in the vmc repository.

printf 'This will DELETE SOME FILES. Read the script before running. Run script (y/n)? '
read -r answer

if [ "$answer" = "${answer#[Yy]}" ]; then
  return
fi

# Meaningful directory.
startup="$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
vmc=$(cd "$(dirname "$0")" && pwd)

# Remove files that will be replaced with symlinks.
rm -vf "$HOME/_vimrc" "$HOME/_gvimrc" "$startup/vimc.ahk"

# Symlink vim config.
ln -sv "$vmc/_vimrc" "$vmc/_gvimrc" "$HOME"

# Symlink ahk config.
ln -sv "$vmc/vmc.ahk" "$startup"
