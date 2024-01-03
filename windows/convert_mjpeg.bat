@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения видеофайлов в формате MJPEG
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "VIDEO_EXTENSION=mp4"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%VIDEO_EXTENSION%") do (
    :: Извлекаем имя файла без расширения
    for /f "delims=." %%i in ("%%~nf") do set "filename=%%i"

    :: Выполняем команду ffmpeg для конвертации в MJPEG
    ffmpeg -hide_banner -i "%%f" -q:v 5 -vcodec mjpeg "%OUT%\!filename!.mjpeg"
)

echo All videos have been converted to MJPEG format.
