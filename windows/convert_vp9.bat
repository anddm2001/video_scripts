@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения видеофайлов
set "OUT=C:\path\to\export\directory"

:: Исходное и целевое расширения видеофайлов
set "SOURCE_EXTENSION=mp4"
set "TARGET_EXTENSION=webm"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%SOURCE_EXTENSION%") do (
    :: Извлекаем имя файла без расширения
    for /f "delims=." %%i in ("%%~nf") do set "filename=%%i"

    :: Выполняем команду ffmpeg для кодирования в VP9 с разрешением Full HD и без звуковой дорожки
    ffmpeg -i "%%f" -vf "scale=1920:1080" -c:v vp9_qsv -b:v 2M -an "%OUT%\!filename!.%TARGET_EXTENSION%"
)

echo All videos have been encoded in VP9 format with Full HD resolution and no audio.
