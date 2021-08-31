# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

alias icat="kitty +kitten icat"
set PATH "$PATH:/home/manos/bin:/usr/local/scripts:/opt"
alias kitty-update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias up="cd .."
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
