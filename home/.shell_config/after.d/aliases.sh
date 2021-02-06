case "$OSTYPE" in
  darwin*)  alias ls="ls -G" ;; 
  *)        alias ls="ls --color" ;;
esac
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias k="kubectl"
