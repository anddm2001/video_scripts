#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/misc/video/in/01012024"

# Путь к каталогу для сохранения видеофайлов
OUT="/misc/video/out/vp9/fhd"

# Исходное и целевое расширения видеофайлов
SOURCE_EXTENSION="MP4"
TARGET_EXTENSION="webm"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$SOURCE_EXTENSION; do
    # Извлекаем имя файла без расширения
    filename=$(basename "$f" ".$SOURCE_EXTENSION")

    # Выполняем команду ffmpeg для кодирования в VP9 с разрешением Full HD и без звуковой дорожки
    ffmpeg -i "$f" -vf "scale=1920:1080" -c:v libvpx-vp9 -b:v 2M -an "$OUT/$filename.$TARGET_EXTENSION"
done

echo "All videos have been encoded in VP9 format with Full HD resolution and no audio."
