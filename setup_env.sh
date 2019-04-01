#!/bin/bash

aptget='sudo apt-get'
chsh='sudo chsh'
fccache='sudo fc-cache'
if [ `whoami` = 'root' ]; then
    aptget='apt-get'
    chsh='chsh'
    fccache='fc-cache'
fi
$aptget update
$aptget install -y zsh exuberant-ctags git python fasd

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"
homeshick clone LionelMartin/Setup
homeshick clone robbyrussell/oh-my-zsh
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

echo "installing oh my zsh"
ln -s ~/.homesick/repos/oh-my-zsh ~/.oh-my-zsh
$chsh -s /bin/zsh
$fccache -f -v
