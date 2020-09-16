# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Custom Spaceshipt prompt theme configuration
[[ -r ${HOME}/.spaceshiprc ]] && . ${HOME}/.spaceshiprc

# You may need to manually set your language environment
export LANG=en_GB.UTF-8
export LC_CTYPE=pt_BR.UTF-8

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

# Enable keychain
if [ $+commands[keychain] ]; then
  eval $(keychain --eval --quiet --confhost --noask --nogui)
fi


# Enable luarocks
if [[ $+commands[luarocks] && -d ${HOME}/.luarocks ]]; then
  eval "$(luarocks --lua-version 5.3 path --no-bin)"
  path=(${HOME}/.luarocks/bin $path)
fi


# Initialize perlbrew
if [ -f "${HOME}/perl5/perlbrew/etc/bashrc" ]; then
    . "${HOME}/perl5/perlbrew/etc/bashrc"
fi


# Ruby virtual environments (rbenv)
if [ $+commands[rbenv] ]; then
  eval "$(rbenv init - --no-rehash zsh)"
fi


# Python virtual environments (pyenv)
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PIPENV_VENV_IN_PROJECT=1

if [ $+commands[pyenv] ]; then
  eval "$(pyenv init - --no-rehash zsh)"
fi

# Conda setup
if [ -d ${HOME}/.miniconda3 ]; then
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$("${HOME}/.miniconda3/bin/conda" 'shell.zsh' 'hook' \
                  2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "${HOME}/.miniconda3/etc/profile.d/conda.sh" ]; then
          . "${HOME}/.miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="${HOME}/.miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi

# Prepend local binary path
export PATH="${HOME}/bin:$PATH"

# Load aliases
#[[ -r ${HOME}/.aliasrc ]] && . ${HOME}/.aliasrc
#[[ -r ${HOME}/.aliasrc.local ]] && . ${HOME}/.aliasrc.local
# Load functions
[[ -r ${HOME}/.functionrc ]] && . ${HOME}/.functionrc
[[ -r ${HOME}/.functionrc.local ]] && . ${HOME}/.functionrc.local
# Load hashes
[[ -r ${HOME}/.hashrc ]] && . ${HOME}/.hashrc
[[ -r ${HOME}/.hashrc.local ]] && . ${HOME}/.hashrc.local
# Load keybindings
#[[ -r ${HOME}/.keybindingrc ]] && . ${HOME}/.keybindingrc
#[[ -r ${HOME}/.keybindingrc.local ]] && . ${HOME}/.keybindingrc.local
