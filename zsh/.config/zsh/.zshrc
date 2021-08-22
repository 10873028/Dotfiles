[[ $- != *i* ]] && return

autoload -U colors
colors
stty stop undef
setopt interactive_comments

HISTSIZE=1000
SAVEHIST=1000 HISTFILE=$ZDOTDIR/.histfile

autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
compinit

bindkey -v
bindkey -M viins "jk" vi-cmd-mode
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M vicmd "j" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
bindkey "^?" backward-delete-char

precmd() { echo -ne "\e[5 q"; }
zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = "block" ]]; then
    echo -ne "\e[1 q"
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = "" ]] || [[ $1 = "beam" ]]; then
    echo -ne "\e[5 q"
  fi
}

zle -N zle-keymap-select
echo -ne "\e[5 q"

alias sudo='sudo -v; sudo '
alias la='exa -a --group-directories-first'
alias ll='exa -la --group-directories-first'
alias ls='exa --group-directories-first'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -v'
alias cat='bat -p'
alias cs='clear;exa -TaL=1 --group-directories-first'
alias ra='. ranger'
alias please='sudo $(history -p !!)'
alias vim='nvim'

z() {
    if [ ! -z $1 ]; then
        cd $(fd -Hat d -E Trash -E .Trash-1000 -E .git --base-directory $1 2> /dev/null | fzf || echo .)
    else
        cd $(fd -Hat d -E Trash -E .Trash-1000 -E .git --base-directory $HOME 2> /dev/null | fzf || echo .)
    fi
}

git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " ${ref##*/}"
}

conda_prompt() {
    [ -z $CONDA_PREFIX ] && return
    echo " ${CONDA_PREFIX##*/}"
}

setopt prompt_subst
PROMPT='%F{cyan}$(conda_prompt)%F{magenta}$(git_branch) %F{yellow}%1d %F{green}→ %F{white}'
RPROMPT='%(?,%F{green}owo,%F{red}ΦwΦ)'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/user/dev/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/user/dev/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/user/dev/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/user/dev/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

