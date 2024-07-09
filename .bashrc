#
# ~/.bashrc
#

set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
alias ll='ls -l'
alias la='ls -a'
alias nv='nvim'
alias hist='cat ~/.bash_history'

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
