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
alias ll='ls -la'
alias la='ls -a'
alias nv='nvim'
alias hist='cat ~/.bash_history'
alias sudo='sudo '

#unlimited history
export HISTFILESIZE=
export HISTSIZE=

#write history after every line
#shopt -s histappend
#PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"


function cl() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls -l
}

# If running in an X session, set keyboard repeat delay and rate.
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    echo "$DISPLAY"
    xset r rate 250 50
# If running in a Wayland session with Hyprland, set keyboard repeat delay and rate.
elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    : #nothing to do.  Handled by hyprland.conf
elif [ "$XDG_SESSION_TYPE" = "tty" ]; then
    : #todo
else
    echo "Error from .bashrc: Seems to not be x11 or wayland?"
fi

#color the prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

export EDITOR=nvim
export VISUAL=nvim
