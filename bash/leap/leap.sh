#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

show_help() {
    local NAME
    NAME=$(basename "$0")
    cat <<EOF
Usage: $NAME <year>
EOF
}

main () {
    # If not one argument only, or if the argument contains anything but digits...
    if [[ "$#" -ne 1 || ! -z "${1//[0-9]/}" ]]; then
        show_help
        exit 1
    fi

    # Check for leapiness
    if [[ $(( $1 % 400)) -eq 0 || ( $(( $1 % 4 )) -eq 0 && $(( $1 % 100 )) -ne 0 ) ]] ; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"