#!/bin/env bash

# DEPENDENCIES
# - git


if [[ -d "$HOME/github/dotfiles" ]];then
	echo "Directory $HOME/github/dotfiles already exists."
	exit 1
else
	mkdir -p $HOME/github/dotfiles/ && git clone --bare https://github.com/manos00/dotfiles $HOME/github/dotfiles
	conf="/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
	cd $HOME && $(conf checkout)
	exit 0
fi
