# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load profiles
[ -r /etc/zsh/zprofile ] && . /etc/zsh/zprofile
[ -r ${HOME}/.zprofile ] && . ${HOME}/.zprofile

# Use a 256-color terminal
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
  export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
if [[ ${XDG_SESSION_TYPE} = 'tty' ]]; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
    [ -r ${HOME}/.powerlinerc.local ] && . ${HOME}/.powerlinerc.local
     ${HOME}/.powerlinerc_console
    source ${HOME}/.powerlinerc_noicon
else
    ZSH_THEME="powerlevel9k/powerlevel9k"
    [ -r ${HOME}/.powerlinerc.local ] && . ${HOME}/.powerlinerc.local
    source ${HOME}/.powerlinerc.local
    source ${HOME}/.powerlinerc
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    archlinux
    bundler
    common-aliases
    copyfile
    copydir
    cp
    cpanm
    docker
    encode64
    extract
    gem
    git-extras
    history
    python
    sublime
    sudo
    systemd
    urltools
    # custom plugins
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

## Allow double single quote ('') for escaping
setopt rcquotes

## input directory's name whenever I want  to change the working dir
#setopt autocd

## ask for confirmation every time I bang (!!) a command
#setopt histverify

## remove extra spaces and tabs from history entries
setopt hist_reduce_blanks

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
#   export EDITOR='mvim'
    export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load aliases
[ -r ${HOME}/.aliases ] && . ${HOME}/.aliases
[ -r ${HOME}/.aliases.local ] && . ${HOME}/.aliases.local
# Load functions
[ -r ${HOME}/.functions ] && . ${HOME}/.functions
[ -r ${HOME}/.functions.local ] && . ${HOME}/.functions.local
# Load hashes
[ -r ${HOME}/.hashes ] && . ${HOME}/.hashes
[ -r ${HOME}/.hashes.local ] && . ${HOME}/.hashes.local
