# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#                              History Settings                               #
###############################################################################

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Save history as soon as command is typed
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Keep bash history of different tmux sessions seperate
if [[ $TERM == "tmux-256color" ]]
then
    export HISTFILE=/home/$USER/.tmux-bash-history/$(tmux display-message -p '#S')
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

###############################################################################
#                           Setting Bash Prompt                               #
###############################################################################
    
# set a fancy prompt 
color_prompt=yes
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/[^(]*(\([^)]*\).*/\1/'
}

echo_if_git() {
    if [[ -n $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/[^(]*(\([^)]*\).*/\1/') ]]; then echo -n "$1"; else echo -n ""; fi
#  
}

export emulator_shell_prompt="powerline"
export tty_shell_prompt="multiline"
if [ -n "$DISPLAY" ];
then
    case "$emulator_shell_prompt" in
        # single line prompt
        "singleline") PS1="\n\[\033[0;35m\]\342\224\243\[\033[1;35m\]($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[32m\]\u@\h'; fi)\[\033[1;35m\])\342\224\201(\[\e[1;33m\]\W\[\e[1;35m\])\342\224\253 \[\033[1;34m\]$ \[\033[0m\]"
            ;;
        # Multiline prompt
        "multiline") PS1="\n\[\e[0;35m\]\342\224\214\[\e[1;35m\](\[\e[32m\]\u@\h\[\e[1;35m\])\342\224\200(\[\e[1;30m\]\w\[\e[1;35m\])\$(echo_if_git '\342\224\200(' )\[\e[1;36m\]\$(parse_git_branch)\[\e[1;35m\]\$(echo_if_git ')')\n\[\e[0;35m\]\342\224\224\342\224\200\[\e[1;35m\](\[\e[1;33m\]\W\[\e[1;35m\])\342\224\200] $ \[\e[0m\]"
            ;;
        # Powerline Prompt
        "powerline") PS1="\[\e[1;103;30m\] \u \[\e[47;33m\]\[\e[47;30;7m\]\[\e[0;1;34;100m\] \h \[\e[7;100;92m\]\[\e[0;1;30;102m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[7;30m\]\[\e[0;1;100;35m\] \w \[\e[0;1;30;104m\] \[\e[30m\]$ \[\e[49;34m\] \[\e[0m\] "
            ;;
    esac
else
    case "$tty_shell_prompt" in
        # single line prompt
        "singleline") PS1="\n\[\033[0;35m\]\342\224\243\[\033[1;35m\]($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[32m\]\u@\h'; fi)\[\033[1;35m\])\342\224\201(\[\e[1;33m\]\W\[\e[1;35m\])\342\224\253 \[\033[1;34m\]$ \[\033[0m\]"
            ;;
        # Multiline prompt
        "multiline") PS1="\n\[\e[0;35m\]\342\224\214\[\e[1;35m\](\[\e[32m\]\u@\h\[\e[1;35m\])\342\224\200(\[\e[1;30m\]\w\[\e[1;35m\])\$(echo_if_git '\342\224\200(' )\[\e[1;36m\]\$(parse_git_branch)\[\e[1;35m\]\$(echo_if_git ')')\n\[\e[0;35m\]\342\224\224\342\224\200\[\e[1;35m\](\[\e[1;33m\]\W\[\e[1;35m\])\342\224\200] $ \[\e[0m\]"
            ;;
        # Powerline Prompt
        "powerline") PS1="\[\e[1;103;30m\] \u \[\e[47;33m\]\[\e[47;30;7m\]\[\e[0;1;34;100m\] \h \[\e[7;100;92m\]\[\e[0;1;30;102m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[7;30m\]\[\e[0;1;100;35m\] \w \[\e[0;1;30;104m\] \[\e[30m\]$ \[\e[49;38;5;4m\] \[\e[0m\] "
            ;;
    esac
fi

# move prompt up by 8 lines
# PS1=$'\n\n\n\n\n\n\n\n\e[8A'"$PS1"

set -o vi

export LIBVA_DRIVER_NAME=iHD
export PATH=$PATH:~/.local/bin:~/.local/share/flutter/bin
export EDITOR=tnvim
export VISUAL=tnvim

alias ls='ls --color=auto'
alias lsa='ls -a'
alias cls='clear'
alias nvim='tnvim'
alias vi='/usr/bin/nvim'
alias ..='cd ..'

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export QSYS_ROOTDIR="/home/arch/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
clear && neofetch --gap 10
