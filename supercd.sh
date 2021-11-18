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
function supercd_maketaggedlist {
    local A=${_CD_HISTORY[@]}
    local T=""
    local d
    local n=0
    local listfile=$(/usr/bin/mktemp)

    cp /dev/null $listfile

    for d in $A
    do
        echo "$n $d" >> $listfile
        ((n+=1))
    done
    echo $listfile
}
function supercd_cdsort {
    local A=${_CD_HISTORY[@]}
    _CD_HISTORY=()
    for d in $A
    do
        echo -- "$d"
    done | sort | readarray _CD_HISTORY
}
function supercd_text {
    local PS3
    PS3="Pick a directory (0 to exit):"
    select d in "${_CD_HISTORY[@]}"
    do
        if [[ -z "$d" ]]; then break; fi
        builtin cd "$d"
        break
    done
}
function _supercd {
    local choice
    local taglist
    local rc
    if [[ "$1" = "--" ]]; then
        if type dialog 2>&1 >/dev/null; then
            taglist=$(supercd_maketaggedlist)
            trap "rm -- $taglist" return
            # echo "taglist is // $taglist //"
            if choice=$(dialog --stdout --menu "Choose a directory" 0 0 0 --file $taglist )
            then 
                #echo "choice is $choice"
                #echo "dir is ${_CD_HISTORY[$choice]}"
                builtin cd ${_CD_HISTORY[$choice]}
            else
                echo "no change"
            fi
        else
            supercd_text
        fi
    elif [[ -z "$1" ]]; then
        builtin cd "$HOME"
        supercd_cdadd "$PWD"
    else
        builtin cd "$1"
        supercd_cdadd "$PWD"
    fi
}
alias cd=_supercd

