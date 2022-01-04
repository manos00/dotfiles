#!/bin/env bash

# DEPENDENCIES
# - git


# check if dotfiles folder exists already
if [[ -d "$HOME/github/dotfiles" ]];then
	echo "Directory $HOME/github/dotfiles already exists."
	exit 1
else
	LOG="/tmp/checkout-err.txt"
	ERRORL1="error: The following untracked working tree files would be overwritten by checkout:"
	ERRORLX="Please move or remove them before you switch branches."
	trap "rm -f $LOG" EXIT
	mkdir -p $HOME/github/dotfiles/ && git clone --bare https://github.com/manos00/dotfiles $HOME/github/dotfiles
	conf="/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
	cd $HOME && $conf checkout 2> $LOG
	if [[ $? == 1 ]];then
		l=$(wc -l < $LOG)
		if [[ $(sed '1q;d' $LOG) == $ERRORL1 ]];then
			BADFILES=()
			echo There are conflicting files:
			for i in $(seq 2 $l);do
				if [[ $(sed "${i}q;d" $LOG) != $ERRORLX ]];then
					line="$(sed "${i}q;d" $LOG)"
					echo $line | sed 's/ //g'
					BADFILES+=$line
				else
					break
				fi
			done
			# Choose which files to backup or delete
			for file in ${BADFILES[@]};do
				echo "Do you want to backup $file? (y/n)" 
				choice=""
				while [[ $choice != "y" && $choice != "n" ]];do
					read choice
				done
				if [[ $choice == "y" ]];then
					backup=$HOME/dotfilesbackup
					if [[ ! -d $backup ]];then	
						mkdir $backup
					fi
					mv $file $backup
				else
					echo Aborting...
					exit 0
				fi
 			done
			cd $HOME && $conf checkout 2> $LOG
		else
			echo An unknown error occured!
			cat $LOG
			exit 1
		fi
	else
		exit 0
	fi
fi
