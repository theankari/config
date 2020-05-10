#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#source /usr/share/doc/pkgfile/command-not-found.bash
#source /etc/profile.d/autojump.bash

export TERM="xterm-256color"

alias lsa='ls --color=auto -l -a'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

alias config='/usr/bin/git --git-dir=/home/aron/.myconf/ --work-tree=/home/aron'

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
GIT_PROMPT_ONLY_IN_REPO=1

export PS1="${RED}\u${GREEN}@\W$ ${RESET}"

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

shopt -s autocd
shopt -s histappend
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
shopt -s dotglob # files beginning with . to be returned in the results of path-name expansion.
complete -cf sudo

export DEV=aron
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.local/bin:~/work/dev/bin/:./scripts/
export ANDROID_HOME="$HOME/Android/Sdk/"
export TERMINAL=urxvt

if [ -f $HOME/.local_config ]; then
    source $HOME/.local_config
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/aron/.sdkman"
[[ -s "/home/aron/.sdkman/bin/sdkman-init.sh" ]] && source "/home/aron/.sdkman/bin/sdkman-init.sh"
