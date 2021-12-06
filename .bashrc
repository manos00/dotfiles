#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Variables
export PATH="/usr/local/scripts/:$PATH"

eval "$(starship init bash)"
