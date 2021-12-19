d() {
    local _dir
    if [[ -z $1 ]]; then
        _dir=$(fd -Hat d -E Trash -E .git -E .git -E .Trash-1000 --base-directory $HOME 2> /dev/null | fzf)
    else
        _dir=$(fd -Hat d -E Trash -E .git -E .git -E .Trash-1000 --base-directory $1 2> /dev/null | fzf)
    fi
    if [[ ! -z $_dir ]]; then
        cd $_dir
    fi
}

f() {
    local _file
    if [[ -z $1 ]]; then
        _file=$(fd -Hat f -E Trash -E .git -E .Trash-1000 --base-directory $HOME 2> /dev/null | fzf)
    else
        _file=$(fd -Hat f -E Trash -E .git -E .Trash-1000 --base-directory $1 2> /dev/null | fzf)
    fi
    if [[ ! -z $_file ]]; then
        cd "${_file%/*}"
    fi
}
