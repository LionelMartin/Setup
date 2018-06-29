# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export TERM="xterm-256color"
DEFAULT_USER="lmarti778"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs_joined context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_MODE='powerline'

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(branch colored-man common-aliases command-not-found docker git gitfast last-working-dir themes)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.homesick/repos/homeshick/homeshick.sh

if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi

homeshick --quiet refresh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
[ -f "$HOME/Applications/sfx/tools/sfx-commandline/sfxrc" ] && source "$HOME/Applications/sfx/tools/sfx-commandline/sfxrc"
