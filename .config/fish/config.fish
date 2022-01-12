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

alias config="/usr/bin/git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME"
alias p="sudo pacman -S"
alias cm="cmatrix -s -C cyan" #most important one obviously
alias randomvid="vlc (random choice (ls | grep -v .jpg | grep -v .png))"
alias upgrade="yay -Syu"
alias globfind="sudo find / -name"
alias gccexe="x86_64-w64-mingw32-gcc"
alias del="rmtrash"
alias rm="echo use rmtrash/del"

# VARIABLES
set PATH "$PATH:$HOME/bin:/usr/local/scripts:/opt"

# PRINTING
#$HOME/.pokemon-icat/pokemon-icat.sh

# PROGRAMS
starship init fish | source
