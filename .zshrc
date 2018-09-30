# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rbn/.oh-my-zsh"

if [[ $(tty) == /dev/tty* ]]; then
    export TERM=xterm-256color
else
    ZSH_THEME="powerlevel9k/powerlevel9k"
    #ZSH_THEME="agnoster"
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  archlinux docker git rsync sudo systemd
)

source $ZSH/oh-my-zsh.sh

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export VISUAL="nano"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory autocd extendedglob notify
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rbn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.config/zsh/aliases.conf

export XKB_DEFAULT_LAYOUT=de

if [ $(tty) = "/dev/tty1" ]; then
    export CLUTTER_BACKEND=wayland
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_WAYLAND_FORCE_DPI=96
    export SDL_VIDEODRIVER=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1

    sway
    exit 0
fi
