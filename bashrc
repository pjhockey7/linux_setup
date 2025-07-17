#
# ~/.bashrc
#

if [ -z "$SSH_AGENT_PID" ]; then
  eval "$(ssh-agent -s)"
fi

set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias nv='nvim'
alias hist='cat ~/.bash_history'
alias sudo='sudo '

#unlimited history
export HISTFILESIZE=
export HISTSIZE=

#write history after every line
shopt -s histappend
PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"


function cl() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls -l
}

# If running in an X session, set keyboard repeat delay and rate.
if [ -n "$DISPLAY" ]; then
  xset r rate 200 50
fi
