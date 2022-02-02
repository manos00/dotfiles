#!/bin/env bash

# DEPENDENCIES
# - git


# check if dotfiles folder exists already
if [[ -d "$HOME/github/dotfiles" ]];then
	echo "Directory $HOME/github/dotfiles already exists."
	exit 1
else
	# setting frequently used vars
	LOG="/tmp/checkout-err.txt"
	ERRORL1="error: The following untracked working tree files would be overwritten by checkout:"
	ERRORLX="Please move or remove them before you switch branches."
	# setting up trap - deletese log on exit
	trap "rm -f $LOG" EXIT
	# clone repo
	mkdir -p $HOME/github/dotfiles/ && git clone --bare https://github.com/manos00/dotfiles $HOME/github/dotfiles
	conf="/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
	# try to put dotfiles in their respective dirs (+redirect sterr to log file)
	echo "trying to put files in their respective directories"
	cd $HOME && $conf checkout master 2> $LOG
	if [[ $? == 1 ]];then
		l=$(wc -l < $LOG)
		# read first line of log to check if its the one error i accounted for lol
		# there are defenetly way better ways to do this but i couldnt figure out something else
		if [[ $(sed '1q;d' $LOG) == $ERRORL1 ]];then
			BADFILES=()
			echo There are conflicting files:
			for i in $(seq 2 $l);do
				if [[ $(sed "${i}q;d" $LOG) != $ERRORLX ]];then
					line="$(sed "${i}q;d" $LOG)"
					echo $line | sed 's/ //g'
					# append conflicting file paths to BADFILES
					BADFILES+=$line
				else
					# break if list of file paths ends
					break
				fi
			done
			# changing input source
			exec < /dev/tty
			# decide whether to back up files or proceed manually
			echo "Do you want to back them up automatically?"
			backup=$HOME/dotfilesbackup
			echo "The files will be saved to $backup"
			if [[ ! -d $backup ]];then	
				mkdir $backup
			else
				echo "As the directory $backup already exists, please check its contents."
				echo "Files in $backup may otherwise be OVERWRITTEN without further warning"
			fi
			echo "Enter 'y' to proceed."
			read choice
			if [[ $choice == "y" ]];then
				echo "backing up files"
				for file in ${BADFILES[@]};do
					mv $file $backup
				done
				echo "backup completed"
			else
				echo "Aborting..."
				exit 1
			fi
			echo "performing git checkout"
			echo "moving files into their respective directory"
			cd $HOME && $conf checkout master 2> $LOG
			echo "done!"
			# load submodules
			echo "loading submodules"
			$conf submodule update --init
			echo "done!"
			echo "exiting..."
			exit 0
		else
			echo An unknown error occured!
			cat $LOG
			exit 1
		fi
	else
		exit 0
	fi
fi
