#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2

cd $SOURCE_DIR

find . -path '*/**/.vscode/***' -not -path '*/node_modules/*' -print0 | rsync -aR --files-from=- --from0 ./ $DESTINATION_DIR

cp openclassrooms.code-workspace $DESTINATION_DIR
cd -
