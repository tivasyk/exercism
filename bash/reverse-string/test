#!/usr/bin/env bash

#!/usr/bin/env bash

main() {
    input="$*"

    for (( i=${#input}; i>0; i-- )); do
        output="${output}${input:$(( i - 1)):1}"
    done
            
    echo "${output}"
}
          
main "$@"
