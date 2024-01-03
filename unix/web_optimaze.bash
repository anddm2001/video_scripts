#!/bin/bash

# Путь к каталогу импорта видеофайлов
IN="/path/to/import/directory"

# Путь к каталогу для сохранения оптимизированных видеофайлов
OUT="/path/to/export/directory"

# Расширение видеофайлов
EXTENSION="mp4"

# Параметры кодирования
VIDEO_CODEC="libx264"
AUDIO_CODEC="aac"
BITRATE="1000k"
MAX_WIDTH="1280"

# Перебираем все видеофайлы в каталоге импорта
for f in "$IN"/*.$EXTENSION; do
    # Извлекаем имя файла
    filename=$(basename "$f")

    # Выполняем команду ffmpeg для оптимизации видео для веба с переносом moov атома
    ffmpeg -hide_banner -i "$f" -vf "scale='min($MAX_WIDTH,iw)':-2" -c:v "$VIDEO_CODEC" -b:v "$BITRATE" -c:a "$AUDIO_CODEC" -movflags +faststart "$OUT/$filename"
done

echo "All videos have been optimized for web."
