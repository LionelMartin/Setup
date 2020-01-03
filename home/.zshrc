source "$HOME/.shell_config/functions.sh"

sourcePath ".shell_config/before.d"

# set PATH so it includes user's private bin if it exists
prependToPath "$HOME/bin"

# set PATH so it includes user's private bin if it exists
prependToPath "$HOME/.local/bin"


source $HOME/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "ael-code/zsh-colored-man-pages"
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "djui/alias-tips"
zplug "plugins/command-not-found", from:"oh-my-zsh"
zplug "plugins/common-aliases", from:"oh-my-zsh"
zplug "plugins/fasd", from:"oh-my-zsh"
zplug "plugins/extract", from:"oh-my-zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose
# TERM="xterm-256color"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs_joined context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=9
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_middle"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

setopt AUTO_CD

source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
homeshick --quiet refresh

autoload -U +X compinit && compinit
if type "kitty" > /dev/null; then
	kitty + complete setup zsh | source /dev/stdin
fi
autoload -U +X bashcompinit && bashcompinit

prependToPath "/snap/bin"
export PATH

# force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zhistory
export HISTSIZE HISTCONTROL HISTFILE SAVEHIST

if [ -v EDITOR ]; then
    export EDITOR="nvim"
fi

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

sourcePath ".shell_config/after.d"
