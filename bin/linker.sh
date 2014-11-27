#!/bin/bash

function symlink {
  ln -nsf $1 $2
}

directory_warning() {
  name=$(basename $0)
  if [[ ! "$PWD/bin/$name" -ef "$0" ]]; then
    echo "${yellow}Please run '$name' from the root folder${normal}"
    exit 1
  fi
}

create_default_directories() {
  mkdir ~/go
  mkdir ~/rails
  mkdir ~/ruby
  mkdir ~/node
  mkdir ~/.vim/autoload
}

directory_warning
create_default_directories

for file in dotfiles/.[^.]*; do
  path="$(pwd)/$file"
  base=$(basename $file)
  target="$HOME/$(basename $file)"

  if [[ -h $target && ($(readlink $target) == $path)]]; then
    echo -e "\x1B[90m~/$base is symlinked to your dotfiles.\x1B[39m"
  elif [[ -f $target && $(md5 $path) == $(md5 $target) ]]; then
    echo -e "\x1B[32m~/$base exists and was identical to your dotfile.  Overriding with symlink.\x1B[39m"
    symlink $path $target
  elif [[ -a $target ]]; then
    read -p "\x1B[33m~/$base exists and differs from your dotfile. Override?  [yn]\x1B[39m" -n 1

    if [[ $REPLY =~ [yY]* ]]; then
      symlink $path $target
    fi
  else
    echo -e "\x1B[32m~/$base does not exist. Symlinking to dotfile.\x1B[39m"
    symlink $path $target
  fi
done
