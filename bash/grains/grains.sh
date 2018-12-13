#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

show_help() {
    local NAME
    NAME=$(basename "$0")
    cat <<EOF
$NAME will calculate the number of grains on a chessboard
    
Usage: $NAME <square 1-64>
       $NAME total
EOF
}

main () {
    # One argument only (not in the excercise description, but WTH)
    if [[ "$#" -ne 1 ]]; then
        show_help
        exit 1
    fi
    square="$1"
    
    if [[ "${square}" == "total" ]]; then
        echo $( echo "2 ^ 64 - 1" | bc)
    elif [[ -z "${square//[0-9]/}" && "${square}" -le "64" && "${square}" -ge "1" ]]; then
        echo $( echo "2 ^ $(( square-1 ))" | bc)
    else
        echo "Error: invalid input"
        exit 1
    fi
}

main "$@"