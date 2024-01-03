#!/bin/bash

# Путь к каталогу импорта
IN="/path/to/import/directory"

# Путь и имя выходного файла
OUTPUT="/path/to/export/directory/output.mp4"

# Расширение видеофайлов
EXTENSION="mp4"

# Создаем временный файл для списка видео
TEMP_FILE="temp_list.txt"
touch "$TEMP_FILE"

# Собираем список файлов
for f in "$IN"/*.$EXTENSION; do
  echo "file '$f'" >> "$TEMP_FILE"
done

# Склеиваем видео
ffmpeg -hide_banner -f concat -safe 0 -i "$TEMP_FILE" -c copy "$OUTPUT"

# Удаляем временный файл списка
rm "$TEMP_FILE"

echo "All videos have been merged into $OUTPUT"
