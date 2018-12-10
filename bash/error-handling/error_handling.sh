#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

main() {
    input=( $@ )

    for token in "$@"; do
        echo $token
    done
}

main "$@"