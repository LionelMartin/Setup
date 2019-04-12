alias big_dirs='du -xk | sort -n | tail -20'
alias cable_plugged='mii-tool eth0'
alias open_ports='netstat -ntauple'
alias big_files='find / -type f -size +1000000000c'
alias vim='TERM=xterm-256color vim'
alias nvim='TERM=xterm-256color nvim'

alias t="$HOME/.homesick/repos/Setup/todo.txt_cli/todo.sh -d $HOME/.homesick/repos/Setup/todo.txt_cli/todo.cfg"

alias gti="git"
alias gpp="git pull --rebase && git push"
alias gc="git commit"
alias meteo="curl http://wttr.in/Montpellier"
alias start="sh ~/start_tmux.sh"
