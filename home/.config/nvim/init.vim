set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source `=expand("~/.vim/vimrc")`
