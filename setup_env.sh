#!/bin/bash

aptget='sudo apt-get'
chsh='sudo chsh'
if [ `whoami` = 'root' ]; then
    aptget='apt-get'
    chsh='chsh'
fi
$aptget update
$aptget install -y zsh exuberant-ctags ack gvim git python fasd

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"
homeshick clone LionelMartin/Setup
homeshick clone robbyrussell/oh-my-zsh

echo "installing spf 13"
curl http://j.mp/spf13-vim3 -L -o - | sh
#echo "installing bash it"
#git clone http://github.com/revans/bash-it.git ~/.bash_it && ~/.bash_it/install.sh
echo "installing oh my zsh"
ln -s ~/.homesick/repos/oh-my-zsh ~/.oh-my-zsh
$chsh -s /bin/zsh
#echo "installing Liquid prompt"
#git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt
#if [ ! -f ~/.config/liquidpromptrc]; then
#    cp ~/.liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc
#fi
