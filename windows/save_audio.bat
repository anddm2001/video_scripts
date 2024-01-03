@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения аудиофайлов
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "VIDEO_EXTENSION=mp4"

:: Расширение аудиофайлов
set "AUDIO_EXTENSION=mp3"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%VIDEO_EXTENSION%") do (
    :: Извлекаем имя файла без расширения
    set "filename=%%~nf"

    :: Выполняем команду ffmpeg для извлечения аудио
    ffmpeg -hide_banner -i "%%f" -q:a 0 -map a "%OUT%\!filename!.%AUDIO_EXTENSION%"
)

echo All audio tracks have been extracted.
