[[ $- != *i* ]] && return
setopt autocd extendedglob nomatch menucomplete interactive_comments
autoload -U colors
colors
stty stop undef

autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZDOTDIR/.histfile

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f $ZDOTDIR/fzf.zsh ]] && source $ZDOTDIR/fzf.zsh
[[ -f $ZDOTDIR/prompt.zsh ]] && source $ZDOTDIR/prompt.zsh
[[ -f $ZDOTDIR/alias.zsh ]] && source $ZDOTDIR/alias.zsh
[[ -f $ZDOTDIR/vi.zsh ]] && source $ZDOTDIR/vi.zsh

compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ykc/dev/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ykc/dev/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ykc/dev/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ykc/dev/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

