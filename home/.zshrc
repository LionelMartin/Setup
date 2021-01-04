source "$HOME/.shell_config/functions.sh"

sourcePath ".shell_config/before.d"

# set PATH so it includes user's private bin if it exists
prependToPath "$HOME/bin"

# set PATH so it includes user's private bin if it exists
prependToPath "$HOME/.local/bin"


### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
### End of Zplugin installer's chunk

zplugin ice depth=1; zplugin light romkatv/powerlevel10k
zplugin light "ael-code/zsh-colored-man-pages"
zplugin snippet "https://github.com/junegunn/fzf/raw/master/shell/key-bindings.zsh"
zplugin ice as"completion"; zplugin snippet "https://github.com/junegunn/fzf/raw/master/shell/completion.zsh"
zplugin light zsh-users/zsh-autosuggestions
zplugin light "djui/alias-tips"
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/fasd/fasd.plugin.zsh
zplugin snippet OMZ::plugins/extract/extract.plugin.zsh
zplugin ice as"completion"; zplugin snippet "https://github.com/github/hub/blob/master/etc/hub.zsh_completion"
zplugin light zsh-users/zsh-syntax-highlighting #should be last

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

eval "$(hub alias -s)"

source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
homeshick --quiet refresh

autoload -U +X compinit && compinit
if type "kitty" > /dev/null; then
	kitty + complete setup zsh | source /dev/stdin
fi
autoload -U +X bashcompinit && bashcompinit

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

prependToPath "/snap/bin"
prependToPath "/usr/local/opt/mysql-client/bin"

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
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
