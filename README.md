# dotfiles
## My Arch Linux dotfiles :)
### Repository contains configs for the following programs:
- [awesome](https://awesomewm.org/)
- bash
- [fish](https://github.com/fish-shell/fish-shell)
- [alacritty](https://github.com/alacritty/alacritty)
- [termite](https://github.com/thestinger/termite/)
- [picom](https://github.com/yshui/picom)
- [polybar](https://github.com/polybar/polybar)
- [spicetify-cli](https://github.com/khanhas/spicetify-cli)
- [starship](https://github.com/starship/starship)
#### configs for my specific setup
- OpenRGB
### Dependencies:
#### Polybar
- Custom icon font (not available for download, may need to replace icons in config)
#### Spicetify-cli
- [Dribbblish theme](https://github.com/morpheusthewhite/spicetify-themes/tree/master/Dribbblish)
### To use the config files in this repository correctly, follow these steps:
#### Step 1:
- Run the following command to clone this repository as a bare repository:

``mkdir -p $HOME/github/dotfiles/ && git clone --bare https://github.com/manos00/dotfiles $HOME/github/dotfiles``
#### Step 2:
- Add the following alias to your shell config (e.g. .bashrc or .zsh):

``alias config='/bin/env git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'``
- To use the alias you will have to either reload your shell or define it in the current shell scope (That meaning "just type it out in the command line and hit enter")
#### Step 3:
- cd into your ``$HOME`` directory and type ``config checkout``
