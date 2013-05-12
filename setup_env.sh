#!/bin/bash
echo "installing spf 13"
curl http://j.mp/spf13-vim3 -L -o - | sh
echo "installing bash it"
git clone http://github.com/revans/bash-it.git ~/.bash_it && ~/.bash_it/install.sh
echo "installing Liquid prompt"
git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt
if [ ! -f ~/.config/liquidpromptrc]; then
    cp ~/.liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc
fi
