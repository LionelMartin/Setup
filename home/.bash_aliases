alias vi='nvim'
alias big_dirs='du -xk | sort -n | tail -20'
alias cable_plugged='mii-tool eth0'
alias open_ports='netstat -ntauple'
alias big_files='find / -type f -size +1000000000c'
alias vim='vim -T xterm-256color -c NeoCompleteTagMakeCache'
alias nvim='TERM=xterm-256color nvim'

alias gitcheck="python $HOME/Applications/gitcheck/gitcheck.py"
alias clean_vim="rm $HOME/.vimswap/*"
alias t="$HOME/.homesick/repos/Setup/todo.txt_cli/todo.sh -d $HOME/.homesick/repos/Setup/todo.txt_cli/todo.cfg"

alias gitcheck='python ~/Applications/gitcheck/gitcheck.py'
alias log_nginx="tail /var/log/nginx/error.log"
alias log_mongo="tail /var/log/mongodb/mongod.log"
alias gti="git"
alias gpp="git pull --rebase && git push"
alias gc="git commit"
