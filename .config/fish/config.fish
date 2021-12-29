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
alias dtcmmt="git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME commit -a -m "
alias dtpsh="gitdot --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME push origin master"
alias cmmt="git commit -a -m "
alias psh="git push origin master"
alias randomvid="vlc (random choice (ls | grep -v .jpg | grep -v .png))"
alias upgrade="yay -Sy && yay -Qu && sleep 3 && yay -Syu"
alias globfind="sudo find / -name"
alias school="firefox https://lms2.schulcampus-rlp.de/SN-51034/ & disown && cd /media/hAmBuRgEr/Libraries/Documents/Schule"
alias execomp="x86_64-w64-mingw32-gcc"

# VARIABLES
set PATH "$PATH:/home/manos/bin:/usr/local/scripts:/opt"

# PRINTING
#$HOME/.pokemon-icat/pokemon-icat.sh

# PROGRAMS
starship init fish | source
