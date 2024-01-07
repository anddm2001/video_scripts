#!/bin/bash

# Путь к каталогу с исходными видеофайлами
IN_DIR="/bigdata/raw_video"

# Путь к каталогу для сохранения конвертированных видеофайлов
OUT_DIR="/misc/video/out/av1/sri-lanka"

# Исходное и целевое расширения файлов
SOURCE_EXT="y4m"
TARGET_EXT="ivf"

# Путь до исполняемого файла кодировщика в AV1
RAV1E_PATH="/misc/video/utils/rav1e"

# Перебираем все исходные видеофайлы
for f in "$IN_DIR"/*.$SOURCE_EXT; do
    # Определяем имя файла без расширения
    base_name=$(basename "$f" ".$SOURCE_EXT")

    # Выполняем конвертацию в AV1
    "RAV1E_PATH" "$f" -o "$OUT_DIR/$base_name.$TARGET_EXT"
done

echo "Conversion to AV1 completed."
