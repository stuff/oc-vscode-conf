#!/bin/bash

DESTINATION_DIR=$1

DIFFED_COUNTER=0

for FILE in $(find . -type f -path './config/**'); do
    DESTFILE=${FILE/.\/config/$DESTINATION_DIR}
    if test -f "$DESTFILE"; then
        DIFF="$(diff $DESTFILE $FILE)"

        if [[ ! -z "$DIFF" ]]; then
            DIFFED_COUNTER=$((DIFFED_COUNTER + 1))
            diff -u --color $DESTFILE $FILE
            while true; do
                read -r -p "Do you wish to overwrite $DESTFILE? [Y/n] " input

                case $input in
                [yY][eE][sS] | [yY] | "")
                    cp -f $FILE $DESTFILE
                    break
                    ;;
                [nN][oO] | [nN])
                    break
                    ;;
                esac
            done

        fi
    else
        DIFFED_COUNTER=$((DIFFED_COUNTER + 1))
        rsync -aR $FILE $DESTINATION_DIR
    fi
done

if [ "$DIFFED_COUNTER" = 0 ]; then
    echo "No differences, no copied files."
fi
