@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения видеофайлов
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "VIDEO_EXTENSION=mp4"

:: Соотношение сторон (16:9 по умолчанию)
set "ASPECT_RATIO=16:9"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%VIDEO_EXTENSION%") do (
    :: Извлекаем имя файла
    set "filename=%%~nxf"

    :: Выполняем команду ffmpeg для изменения соотношения сторон
    ffmpeg -hide_banner -i "%%f" -vf "setsar=sar=%ASPECT_RATIO%" -c:a copy "%OUT%\!filename!"
)

echo Aspect ratio of all videos has been changed.
