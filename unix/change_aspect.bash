#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения видеофайлов
OUT="/path/to/export/directory"

# Расширение видеофайлов
VIDEO_EXTENSION="mp4"

# Соотношение сторон (16:9 по умолчанию)
ASPECT_RATIO="16:9"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$VIDEO_EXTENSION; do
    # Извлекаем имя файла
    filename=$(basename "$f")

    # Выполняем команду ffmpeg для изменения соотношения сторон
    ffmpeg -hide_banner -i "$f" -vf "setsar=sar=$ASPECT_RATIO" -c:a copy "$OUT/$filename"
done

echo "Aspect ratio of all videos has been changed."
