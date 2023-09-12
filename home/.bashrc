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
HISTFILESIZE=50000

# Save history as soon as command is typed
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Keep bash history of different tmux sessions seperate
if [[ $TERM == "tmux-256color" ]] || [[ $TERM == "screen-256color" ]]
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
prompt_style=full
export prompt_dir_style

# pl_hs=""
# pl_ss="\/"

pl_hs=""
pl_ss="\/"

# pl_hs=" "
# pl_ss=" "

# pl_hs=""
# pl_ss=""

# pl_hs=" "
# pl_ss=""

# pl_hs=""
# pl_ss=""

# pl_hs=""

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
echo_if_venv(){
    if [[ -n $VIRTUAL_ENV ]]; then echo -n "$1"; else echo -n ""; fi
}
parse_venv() {
    echo $VIRTUAL_ENV | awk -F '/' '{print $NF}'
}
parse_pwd(){
    case $prompt_style in
        full)
            case $PWD/ in
                /home/*) echo -n $(pwd | sed -e 's/^\/home\/arch/~/' -e 's/\// '$pl_ss' /g');;
                *) pwd;;
            esac;;
        short) echo -n `pwd | awk -F '/' '{print $NF}'`;;
    esac
}
# 
# 
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
        "powerline") PS1="\[\e[1;44;92m\] \u \[\e[0;1;33;45m\] \h \[\e[0;1;37;41m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[0;1;37;101m\]\$(echo_if_venv '   ')\$(parse_venv)\$(echo_if_venv ' ')\[\e[0;1;7;32;40m\] \$(parse_pwd) \[\e[0;1;31m\] $\[\e[0m\] "
            ;;
        "bolckline") PS1="\[\e[1;103;30m\] \u \[\e[47;33m\]$pl_hs\[\e[0;1;33;47m\] \h \[\e[7;47;92m\]$pl_hs\[\e[0;1;40;102m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[7;34m\]$pl_hs\[\e[0;1;30;104m\]\$(echo_if_venv '   ')\$(parse_venv)\$(echo_if_venv ' ')\[\e[7;30m\]$pl_hs\[\e[0;1;100;35m\] \$(parse_pwd) \[\e[0;1;30;104m\]$pl_hs \[\e[30;40m\]$ \[\e[49;34m\]$pl_hs \[\e[0m\] "
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
        "powerline") PS1="\[\e[1;103;30m\] \u \[\e[47;33m\]\[\e[0;1;33;47m\] \h \[\e[7;47;92m\]\[\e[0;1;30;102m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[7;34m\]\[\e[0;1;30;104m\]\$(echo_if_venv '   ')\$(parse_venv)\$(echo_if_venv ' ')\[\e[7;30m\]\[\e[0;1;100;35m\] \$(parse_pwd) \[\e[0;1;30;104m\] \[\e[30m\]$ \[\e[49;34m\] \[\e[0m\] "
            ;;
    esac
fi

# move prompt up by 8 lines
# PS1=$'\n\n\n\n\n\n\n\n\e[8A'"$PS1"

# Setting options


export LIBVA_DRIVER_NAME=iHD
export PATH=$PATH:~/.local/bin:~/.local/share/flutter/bin:~/.config/emacs/bin
export EDITOR=nvim
# export VISUAL="alacritty --class \"Alacritty:Floating\" -e nvim"
export VISUAL="nve"
export LD_LIBRARY_PATH=~/.local/lib:${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH}
export CPLUS_INCLUDE_PATH=~/.local/include:$CPLUS_INCLUDE_PATH

# set -o vi
alias ls='ls --color=auto'
alias lsa='ls -la'
alias cls='clear'
alias vi='/usr/bin/nvim'
alias prompt-short='prompt_style=short'
alias prompt-full='prompt_style=full'
alias prompt-switch='if [[ $prompt_style == "full" ]]; then prompt-short; else prompt-full; fi'
alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'
alias :e='/usr/bin/nvim'
alias ..='cd ..'
alias ysy='yay -Ss '

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export VIRTUAL_ENV_DISABLE_PROMPT=1
clear && pfetch --gap 10
. "$HOME/.cargo/env"
