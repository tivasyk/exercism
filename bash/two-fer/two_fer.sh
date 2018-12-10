#!/bin/bash
# tivasyk <tivasyk@gmail.com>

main() {
    input=$*
    output="One for X, one for me."

    if [ -z "$input" ]; then
        output=${output/"X"/"you"}
    else
        output=${output/"X"/"$input"}
    fi

    echo "${output}"
}

main "$@"