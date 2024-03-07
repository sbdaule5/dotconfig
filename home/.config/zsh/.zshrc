################################################################################
#                           SHELL PROMPT                                       #
################################################################################
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[  %b ] '

autoload -U colors && colors	# Load colors
setopt PROMPT_SUBST
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M ${vcs_info_msg_0_} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PROMPT='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[red]%}${vcs_info_msg_0_}%{$fg[magenta]%} %~%{$fg[red]%}] $ %{$reset_color%}'
# PS1="%B%{$fg[green]%}%{$bg[blue]%} %n %{$bg[magenta]%}%{$fg[yellow]%} %M \[\e[0;1;37;41m\]\$(echo_if_git '  ')\$(parse_git_branch)\$(echo_if_git ' ')\[\e[0;1;37;101m\]\$(echo_if_venv '   ')\$(parse_venv)\$(echo_if_venv ' ')\[\e[0;1;7;32;40m\] \$(parse_pwd) \[\e[0;1;31m\] $\[\e[0m\] "


setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

################################################################################
#                           SHELL HISTORY                                      #
################################################################################
setopt INC_APPEND_HISTORY
setopt histignoredups
setopt histignorespace
setopt histexpiredupsfirst

HISTFILE=${XDG_STATE_HOME:-~/.local/state}/zsh/history
HISTSIZE=500000
SAVEHIST=400000

################################################################################
#                               COMPLETIONS                                    #
################################################################################
# 
autoload -Uz compinit
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
compinit
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

################################################################################
#                                 ALISES                                       #
################################################################################
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/funcs"

################################################################################
#                               KEYBINDINGS                                    #
################################################################################
# vi mode
# bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Emacs keybindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^B' backward-char
bindkey '^F' forward-char
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^L' clear-screen
bindkey '^W' backward-kill-word
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

setopt beep

################################################################################
#                             ZSH PLUGINS                                      #
################################################################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################
#                             CONFIG FOR TMUX SESSIONS                         #
################################################################################
if [[ $TERM == "tmux-256color" ]] || [[ $TERM == "screen-256color" ]]
then
    TMUX_SESSION_NAME=$(tmux display-message -p '#S')
    # Keep bash history of different tmux sessions seperate
    export HISTFILE=${XDG_STATE_HOME:-~/.local/state}/zsh/tmux-history/${TMUX_SESSION_NAME}

    # Load tmux session specific configs
    if [ -f "${XDG_CONFIG_HOME}/zsh/tmux/${TMUX_SESSION_NAME}.zsh" ]; then
        source ${XDG_CONFIG_HOME}/zsh/tmux/${TMUX_SESSION_NAME}.zsh
    fi
fi
