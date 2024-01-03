#!/bin/bash

# Задаем пути к каталогам для импорта и экспорта
IN="/path/to/import/directory"
OUT="/path/to/export/directory"

# Указываем расширение файлов и кодек для перекодирования
EXTENSION="MP4"
VIDEO_CODEC="libx264"

# Создаем каталог для экспорта, если он не существует
mkdir -p "$OUT"

# Перебираем все файлы с заданным расширением в каталоге импорта
for f in "$IN"/*.$EXTENSION; do
    echo "Processing file: $f"

    # Извлекаем имя файла
    filename=$(basename "$f")

    # Формируем полный путь к файлу для экспорта
    exportFile="$OUT/$filename"

    # Выполняем команду ffmpeg для изменения разрешения файла до HD + удаление аудиопотока
    ffmpeg -hide_banner -i "$f" -vf "scale=1280:720,setpts=2.0*PTS" -an -c:v "$VIDEO_CODEC" "$exportFile"

    echo "Processed: $exportFile"
done

echo "All files processed."
