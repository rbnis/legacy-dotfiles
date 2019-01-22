# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ $(tty) != /dev/tty* ]]; then
    source ~/.config/zsh/theme.conf
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
export VISUAL="nano"
export TERM=xterm-256color
export ELECTRON_TRASH=gio
export GTK_THEME=Materia-dark-compact

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory autocd extendedglob notify complete_aliases
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.config/zsh/aliases.conf

export XKB_DEFAULT_LAYOUT=de

if [ $(tty) = "/dev/tty1" ]; then
#    export GDK_BACKEND=wayland
    export CLUTTER_BACKEND=wayland
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export SDL_VIDEODRIVER=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1

    sway
    exit 0
fi
