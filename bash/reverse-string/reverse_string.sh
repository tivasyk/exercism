#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

main() {
    input="$*"

    # Read the input string from end to start into output
    for (( i=$(( ${#input}-1 )); i>=0; i-- )); do
        output="${output}${input:${i}:1}"
    done
            
    echo "${output}"
}
          
main "$@"