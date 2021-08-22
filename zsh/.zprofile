export ZDOTDIR="$HOME/.config/zsh"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$HOME/.local/bin:$PATH
export LESSHISTFILE=-
export KEYTIMEOUT=30
if [[ "$(tty)" = "/dev/tty1" ]]; then
    startx
fi
