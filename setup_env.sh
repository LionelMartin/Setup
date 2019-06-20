#!/bin/bash

aptget='sudo apt'

if [ `whoami` = 'root' ]; then
    aptget='apt'

fi
$aptget update
$aptget install -y zsh git neovim vim tmux tmuxinator

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
homeshick clone LionelMartin/Setup

chsh -s /bin/zsh
fc-cache -f -v
