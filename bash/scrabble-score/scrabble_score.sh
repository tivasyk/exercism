#!/usr/bin/env bash
# tivasyk <tivasyk@gmail.com>

show_help() {
    local NAME
    NAME=$(basename "$0")
    cat <<EOF
$NAME will calculate the Scrabble score for a word
    
Usage: $NAME <word>
EOF
}

main () {
    # One argument only (not in the excercise description, but WTH)
    if [[ "$#" -ne 1 ]]; then
        show_help
        exit 1
    fi

    local word ; word="$1"
    local score=0

    # Check every $letter in the $word against the $table[] for points
    for ((i=0; i<${#word}; i++)); do
        local letter=${word:$i:1}

        # Simple solution with case
        case ${letter^^} in
            [AEIOULNRST] ) ((score+=1)) ;;
            [DG] ) ((score+=2)) ;;
            [BCMP] ) ((score+=3)) ;;
            [FHVWY] ) ((score+=4)) ;;
            [K] ) ((score+=5)) ;;
            [JX] ) ((score+=8)) ;;
            [QZ] ) ((score+=10)) ;;
            * ) ;;
        esac
    done

    echo "${score}"
}

main "$@"