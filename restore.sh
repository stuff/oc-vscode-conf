#!/bin/bash

DESTINATION_DIR=$1

DIFFED_COUNTER=0

for FILE in $(find . -type f -path './config/**'); do
    DEST_FILE=${FILE/.\/config/$DESTINATION_DIR}
    DEST_FOLDER=$(dirname $DEST_FILE)
    if test -f "$DEST_FILE"; then
        DIFF="$(diff $DEST_FILE $FILE)"

        if [[ ! -z "$DIFF" ]]; then
            DIFFED_COUNTER=$((DIFFED_COUNTER + 1))
            diff -u --color $DEST_FILE $FILE
            while true; do
                read -r -p "Do you wish to overwrite $DEST_FILE? [Y/n] " input

                case $input in
                [yY][eE][sS] | [yY] | "")
                    cp -f "$FILE" "$DEST_FILE"
                    echo "Copied $FILE --> $DEST_FOLDER"
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

        mkdir -p -- "$DEST_FOLDER"
        cp -- "$FILE" "$DEST_FOLDER/"

        echo "Copied $FILE --> $DEST_FOLDER"
    fi
done

if [ "$DIFFED_COUNTER" = 0 ]; then
    echo "No differences, no copied files."
fi
