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

# single line prompt
# PS1="\n\[\033[0;35m\]\342\224\243\[\033[1;35m\]($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[32m\]\u@\h'; fi)\[\033[1;35m\])\342\224\201(\[\e[1;33m\]\W\[\e[1;35m\])\342\224\253 \[\033[1;34m\]$ \[\033[0m\]"
# Multiline prompt
PS1="\n\[\e[0;35m\]\342\224\214\[\e[1;35m\](\[\e[32m\]\u@\h\[\e[1;35m\])\342\224\200(\[\e[1;30m\]\w\[\e[1;35m\])\342\224\200(\[\e[1;36m\]\$(parse_git_branch)\[\e[1;35m\])\n\[\e[0;35m\]\342\224\224\342\224\200\[\e[1;35m\](\[\e[1;33m\]\W\[\e[1;35m\])\342\224\200] $ \[\e[0m\]"

set -o vi

export LIBVA_DRIVER_NAME=iHD
export PATH=$PATH:~/.local/bin:~/.local/share/flutter/bin
export CDPATH=:~/Projects:~

alias ls='ls --color=auto'
alias cls='clear'

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export QSYS_ROOTDIR="/home/arch/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

clear && neofetch --gap 10
