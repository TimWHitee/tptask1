#!/bin/bash

directory_path="$1"

if [ ! -d "$directory_path" ]; then
    echo "Директории '$directory_path' не существует."
    exit 1
fi

find "$1" -type f -delete

echo "Директория'$directory_path' была очищена."
