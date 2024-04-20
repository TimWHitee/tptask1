#!/bin/bash

# Проверка на достоверность ввода
if [ "$#" -ne 2 ]; then
    echo "Чтобы использвть, напишите: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir="$1"
output_dir="$2"
counter=0

# Существует ли входная директория
if [ ! -d "$input_dir" ]; then
    echo "Директория '$input_dir' не найдена"
    exit 1
fi

# Существует ли выходная директория
if [ ! -d "$output_dir" ]; then
    echo "Выходная директория '$output_dir' не существует. Создание..."
    mkdir "$output_dir"
fi

# Идем по всем файлам в директории
find "$input_dir" -type f | while read -r file; do
    
    filename=$(basename -- "$file")

    # Проверяем, существует ли еще один файл с таким же названием 
    if [ -e "$output_dir/$filename" ]; then
        ((counter+=1))
        filename="${counter}_${filename}"
    fi

    # Копируем файл в выходную директорию
    cp "$file" "$output_dir/$filename"
done

echo "Файлы успешно перекопированы."
