bindkey -v
bindkey -M viins "jk" vi-cmd-mode
bindkey -M menuselect "^[[Z" reverse-menu-complete
bindkey "^?" backward-delete-char

precmd() {
    echo -ne "\e[5 q"
}

zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = "block" ]]; then
    echo -ne "\e[1 q"
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = "" ]] || [[ $1 = "beam" ]]; then
    echo -ne "\e[5 q"
  fi
}

zle -N zle-keymap-select
echo -ne "\e[5 q"
