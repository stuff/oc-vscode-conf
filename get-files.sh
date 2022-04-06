#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2

cd $SOURCE_DIR
find . -path '*/**/.vscode' -not -path '*/node_modules/*' -exec cp --parents -r {} $DESTINATION_DIR \;
cp openclassrooms.code-workspace $DESTINATION_DIR
cd -