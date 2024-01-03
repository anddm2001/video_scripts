@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения оптимизированных видеофайлов
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "EXTENSION=mp4"

:: Параметры кодирования
set "VIDEO_CODEC=libx264"
set "AUDIO_CODEC=aac"
set "BITRATE=1000k"
set "MAX_WIDTH=1280"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%EXTENSION%") do (
    :: Извлекаем имя файла
    set "filename=%%~nxf"

    :: Выполняем команду ffmpeg для оптимизации видео для веба с переносом moov атома
    ffmpeg -hide_banner -i "%%f" -vf "scale='min(%MAX_WIDTH%,iw)':-2" -c:v %VIDEO_CODEC% -b:v %BITRATE% -c:a %AUDIO_CODEC% -movflags +faststart "%OUT%\!filename!"
)

echo All videos have been optimized for web.
