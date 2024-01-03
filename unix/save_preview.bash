#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения превью
OUT="/path/to/export/directory"

# Расширение видеофайлов
VIDEO_EXTENSION="mp4"

# Время для захвата превью (в секундах)
PREVIEW_TIME="30"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$VIDEO_EXTENSION; do
    # Извлекаем имя файла без расширения
    filename=$(basename "$f" ".$VIDEO_EXTENSION")

    # Выполняем команду ffmpeg для создания превью
    ffmpeg -hide_banner -ss "$PREVIEW_TIME" -i "$f" -frames:v 1 "$OUT/$filename.jpg"
done

echo "All previews have been created."
