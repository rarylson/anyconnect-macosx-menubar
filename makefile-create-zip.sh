#!/bin/bash

set -e

if [ -z "$BUILD" ]; then
    echo "Error: Must be called from \`Makefile\`" >&2
    exit 1
fi

mkdir "$BUILD_RESOURCES"
for i in "$BUILD_IMAGES/$IMAGES_PREFIX-$2-"*; do
    new_name=${i#"$BUILD_IMAGES/$IMAGES_PREFIX-$2-"}
    cp "$i" "$BUILD_RESOURCES/$new_name"
done
( cd "$BUILD_RESOURCES" && zip "$1" * )
mv "$BUILD_RESOURCES/$1" .
rm -R "$BUILD_RESOURCES"
