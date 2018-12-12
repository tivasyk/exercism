#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

show_help() {
    local NAME
    NAME=$(basename "$0")
    cat <<EOF
Usage: $NAME <integer>
EOF
}

main () {
    # If not one argument only, or if the argument contains anything but digits...
    if [[ "$#" -ne 1 || ! -z "${1//[0-9]/}" ]]; then
        show_help
        exit 1
    fi

    local output=""

    # Pling? Plang? Plong?
    (( $1 % 3 )) || output+="Pling"
    (( $1 % 5 )) || output+="Plang"
    (( $1 % 7 )) || output+="Plong"

    # if output is still empty, pass the input
    echo "${output:-$1}"
}

main "$@"