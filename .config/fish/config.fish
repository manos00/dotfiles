# if status is-login
#    ...
# end
# if status is-interactive
#   ...
# end

# ALIASES
if string match -q "*kitty*" $TERM
	alias icat="kitty +kitten icat"
	alias kitty-update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
end

alias v="vim"
alias gitdot="/usr/bin/git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
alias p="sudo pacman -S"
alias cm="cmatrix -s -C cyan" #most important one obviously

# VARIABLES
set PATH "$PATH:/home/manos/bin:/usr/local/scripts:/opt"
