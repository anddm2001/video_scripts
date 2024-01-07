#!/bin/bash

# Путь к каталогу с исходными видеофайлами
IN_DIR="/path/to/source/directory"

# Путь к каталогу для сохранения конвертированных видеофайлов
OUT_DIR="/path/to/output/directory"

# Исходное и целевое расширения файлов
SOURCE_EXT="mp4"
TARGET_EXT="y4m"

# Перебираем все исходные видеофайлы
for f in "$IN_DIR"/*.$SOURCE_EXT; do
    # Определяем имя файла без расширения
    base_name=$(basename "$f" ".$SOURCE_EXT")

    # Создаем соответствующий каталог в директории назначения
    mkdir -p "$OUT_DIR/$base_name"

    # Выполняем конвертацию
    ffmpeg -i "$f" "$OUT_DIR/$base_name/$base_name.$TARGET_EXT"
done

echo "Conversion completed."
