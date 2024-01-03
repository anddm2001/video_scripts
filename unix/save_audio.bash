#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения аудиофайлов
OUT="/path/to/export/directory"

# Расширение видеофайлов
VIDEO_EXTENSION="mp4"

# Расширение аудиофайлов
AUDIO_EXTENSION="mp3"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$VIDEO_EXTENSION; do
    # Извлекаем имя файла без расширения
    filename=$(basename "$f" ".$VIDEO_EXTENSION")

    # Выполняем команду ffmpeg для извлечения аудио
    ffmpeg -hide_banner -i "$f" -q:a 0 -map a "$OUT/$filename.$AUDIO_EXTENSION"
done

echo "All audio tracks have been extracted."
