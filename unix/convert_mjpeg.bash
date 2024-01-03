#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения видеофайлов в формате MJPEG
OUT="/path/to/export/directory"

# Расширение видеофайлов
VIDEO_EXTENSION="mp4"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$VIDEO_EXTENSION; do
    # Извлекаем имя файла без расширения
    filename=$(basename "$f" ".$VIDEO_EXTENSION")

    # Выполняем команду ffmpeg для конвертации в MJPEG
    ffmpeg -hide_banner -i "$f" -q:v 5 -vcodec mjpeg "$OUT/$filename.mjpeg"
done

echo "All videos have been converted to MJPEG format."
