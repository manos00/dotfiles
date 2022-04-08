# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd histappend

# Aliases
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias handbrake='ghb'
alias config="/usr/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
alias p="sudo pacman -S"
alias globfind="sudo find / -name"

# Variables
export PATH="/usr/local/scripts/:$HOME/.local/bin/:$PATH"
export EDITOR="vim"

# Programs
eval "$(starship init bash)"


