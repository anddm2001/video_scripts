@echo off

:: Путь к каталогу импорта
set "IN=C:\path\to\import\directory"

:: Путь и имя выходного файла
set "OUTPUT=C:\path\to\export\directory\output.mp4"

:: Расширение видеофайлов
set "EXTENSION=mp4"

:: Создаем временный файл для списка видео
set "TEMP_FILE=temp_list.txt"
type NUL > "%TEMP_FILE%"

:: Собираем список файлов
for %%f in ("%IN%\*.%EXTENSION%") do (
    echo file '%%f' >> "%TEMP_FILE%"
)

:: Склеиваем видео
ffmpeg -hide_banner -f concat -safe 0 -i "%TEMP_FILE%" -c copy "%OUTPUT%"

:: Удаляем временный файл списка
del "%TEMP_FILE%"

echo All videos have been merged into %OUTPUT%
