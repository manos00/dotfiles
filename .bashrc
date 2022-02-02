# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Variables
export PATH="/opt/:/usr/local/scripts/:$PATH"
export EDITOR="vim"

# Programs
eval "$(starship init bash)"
