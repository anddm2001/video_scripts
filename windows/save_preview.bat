@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения превью
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "VIDEO_EXTENSION=mp4"

:: Время для захвата превью (в секундах)
set "PREVIEW_TIME=30"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%VIDEO_EXTENSION%") do (
    :: Извлекаем имя файла без расширения
    for /f "delims=." %%i in ("%%~nf") do set "filename=%%i"

    :: Выполняем команду ffmpeg для создания превью
    ffmpeg -hide_banner -ss %PREVIEW_TIME% -i "%%f" -frames:v 1 "%OUT%\!filename!.jpg"
)

echo All previews have been created.
