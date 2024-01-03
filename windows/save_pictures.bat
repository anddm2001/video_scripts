@echo off

:: Путь к каталогу импорта видеофайлов
set "IN=C:\path\to\import\directory"

:: Путь к каталогу для сохранения изображений
set "OUT=C:\path\to\export\directory"

:: Расширение видеофайлов
set "VIDEO_EXTENSION=mp4"

:: Перебираем все видеофайлы в каталоге импорта
for %%f in ("%IN%\*.%VIDEO_EXTENSION%") do (
    :: Извлекаем имя файла без расширения
    for /f "delims=." %%i in ("%%~nf") do set "filename=%%i"

    :: Создаем каталог для изображений, если он еще не существует
    if not exist "%OUT%\%filename%" mkdir "%OUT%\%filename%"

    :: Выполняем команду ffmpeg для извлечения изображений из видео
    ffmpeg -hide_banner -i "%%f" -vf fps=1 "%OUT%\%filename%\%filename%-%04d.jpg"
)

echo All videos have been split into images.
