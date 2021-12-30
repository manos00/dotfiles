#!/bin/env bash

## DEPENDENCIES
## - git

if [[ -d "$HOME/github/dotfiles" ]];then
	echo "Folder $HOME/github/dotfiles already exists."
	exit 1
else
	mkdir -p $HOME/github/dotfiles/ && git clone --bare https://github.com/manos00/dotfiles $HOME/github/dotfiles
	echo "alias config='/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
	cd $HOME && /bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME checkout
	exit 0
fi
