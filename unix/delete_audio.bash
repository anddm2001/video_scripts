#!/bin/bash

# Задаем пути к каталогам для импорта и экспорта
IN="/path/to/import/directory"
OUT="/path/to/export/directory"

# Указываем расширение файлов
EXTENSION="MP4"

# Создаем каталог для экспорта, если он не существует
mkdir -p "$OUT"

# Перебираем все файлы с заданным расширением в каталоге импорта
for f in "$IN"/*.$EXTENSION; do
    echo "Processing file: $f"

    # Извлекаем имя файла
    filename=$(basename "$f")

    # Формируем полный путь к файлу для экспорта
    exportFile="$OUT/$filename"

    # Выполняем команду ffmpeg для удаления аудиопотока, видеопоток остается без изменений
    ffmpeg -hide_banner -i "$f" -c:v copy -an "$exportFile"

    echo "Processed: $exportFile"
done

echo "All files processed."
