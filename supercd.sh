# source this file from bash
#

declare -a _CD_HISTORY
function supercd_clear {
    _CD_HISTORY=()
}
# prepopulate the cd history with your favorites
function supercd_cdadd {
    # dedup
    for d in ${_CD_HISTORY[@]}
    do
        if [[ "$1" = "$d" ]]; then
            return
        fi
    done
    _CD_HISTORY+=("$1")
}
function supercd_cdsort {
    local A=${_CD_HISTORY[@]}
    _CD_HISTORY=()
    for d in $A
    do
        echo -- "$d"
    done | sort | readarray _CD_HISTORY
}
function _supercd {
    if [[ "$1" = "--" ]]; then
        local PS3
        PS3="Pick a directory (0 to exit):"
        select d in "${_CD_HISTORY[@]}"
        do
            if [[ -z "$d" ]]; then break; fi
            builtin cd "$d"
            break
        done
    elif [[ -z "$1" ]]; then
        builtin cd "$HOME"
        supercd_cdadd "$PWD"
    else
        builtin cd "$1"
        supercd_cdadd "$PWD"
    fi
}
alias cd=_supercd

