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
    local table=( "1:AEIOULNRST" "2:DG" "3:BCMP" "4:FHVWY" "5:K" "8:JX" "10:QZ" )
    local tablelen=${#table[@]}
    local score=0

    # Check every $letter in the $word against the $table[] for points
    for ((i=0; i<${#word}; i++)); do
        local letter=${word:$i:1}
        local points=0
        # Look for the line in table[] containing the $letter
        for ((j=0; j<$tablelen; j++)); do
            local letterset=${table[$j]/#[0-9]*:/}
            # Does the $letterset contain the (uppercased) current $letter of the word?
            if [[ "$letterset" == *"${letter^^}"* ]]; then
                points=${table[$j]/%:[A-Z]*/}
            fi
        done
        score=$(( score + points ))
    done

    echo "${score}"
}

main "$@"