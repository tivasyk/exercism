#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

show_help() {
    # This could be useful to mention $NAME (script name) in the help text:
    # local NAME=$(basename $0)
    cat <<EOF
Usage: ./error_handling <greetee>
EOF
}

main() {
    if [ $# -ne 1 ]; then
        show_help
        exit 1
    fi

    echo "Hello, ${1}"
}

main "$@"