#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения изображений
OUT="/path/to/export/directory"

# Расширение видеофайлов
VIDEO_EXTENSION="mp4"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$VIDEO_EXTENSION; do
    # Извлекаем имя файла без расширения
    filename=$(basename "$f" ".$VIDEO_EXTENSION")

    # Создаем каталог для изображений, если он еще не существует
    mkdir -p "$OUT/$filename"

    # Выполняем команду ffmpeg для извлечения изображений из видео
    ffmpeg -hide_banner -i "$f" -vf fps=1 "$OUT/$filename/$filename-%04d.jpg"
done

echo "All videos have been split into images."
